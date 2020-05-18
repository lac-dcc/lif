{-# LANGUAGE TupleSections #-}

module Pass.Invariant where

import qualified Data.Map                      as Map
import           Data.Bool                      ( bool )
import           Data.List                      ( union
                                                , iterate
                                                )
import           Data.Maybe                     ( fromJust
                                                , maybeToList
                                                )

import qualified Core.Lang                     as Lang
import qualified Flow.Block                    as Block
import qualified Flow.Cfg                      as Cfg
import qualified Flow.DomTree                  as DomTree
import qualified Internal.Graph                as Graph
import           Internal.Constraint            ( solve )

-- | Takes a binary operator, a list of values and the next free
--   variable, and generates a set of instructions of the following
--   form:
--
--       mov(z0, v0 op v1)
--       mov(z1, z0 op v2)
--       mov(z2, z1 op v3)
--       ...
--       mov(zn, zn-1 op vn+1)
fold
    :: (Lang.Value -> Lang.Value -> Lang.Expr)
    -> [Lang.Value]
    -> Lang.IVar
    -> ([Lang.Inst], Lang.IVar)
fold _ []  var = ([], var)
fold _ [v] var = ([Lang.Mov z $ Lang.Value v], Lang.next var)
    where z = show var
fold op [v0, v1] var = ([Lang.Mov z $ v0 `op` v1], Lang.next var)
    where z = show var
fold op (v0 : v1 : vs) var0 =
    let z           = show var0
        ([i], var1) = fold op [v0, v1] var0
        (is , var2) = fold op (Lang.Var z : vs) var1
    in  (i : is, var2)

-- | A condition from path B1 to Bk is a set of expressions such as
--   {p1, ..., pk} where pk is either a 'Value' (id/const) or 'Not
--   Value'. These sets will be later on transformed into a set of
--   instructions:
--
--   { p1, ..., pn } =
--     mov(t1, p1 & p2)
--     mov(t2, t1 & p3)
--     ...
--     mov(tk-1, tk-2, pk)
--
--   A block can have multiple incoming conditions expressed as a
--   set of sets of values { {p1, ..., pk}, {q1, ..., qn} }, where
--
--   { {p1, ..., pk}, {q1, ..., qn} } =
--     mov(t1, p1 & p2)
--     mov(t2, t1 & p3)
--     ...
--     mov(tk-1, tk-2 & pk)
--     mov(tk, q1 & q2)
--     mov(tk+1, tk & q3)
--     ...
--     mov(tk+n-1, tk+n-2, qn)
--
--   The outgoing condition of a block is a single value represented
--   by some variable t. Hence, for a set of incoming conditions
--   { { p1, ..., pk }, { q1, ..., qn } }, we have that the outgoing
--   condition is represented by the last variable tk+n-1.
--
--   Type Cond represents a condition from Bp to B, where Bp is a
--   immediate predecessor of B. The incoming condition, though, is
--   defined as Out(Bp) U { predicate Bp -> B }, where Out is a map
--   between a block and the variable for its outgoing condition.
--
--   We store the label as well as the conditions so we don't need
--   to worry about the correct order related to phi selectors.
data Cond = Cond {cond :: [Lang.Expr], from :: Lang.Label} deriving Show

-- | Takes the root node, the CFG and a var variable, and returns
--   a list of pairs (Block, C) plus the next var variable, where
--   C is a set of pairs (Var, Label) with Var representing one of
--   the incoming conditions of a block.
--
--   We first solve the following constraint system (note that
--   the functions used by bindCond have the same names as those
--   that appear in the  equations, but with differences due to
--   implementation details):
--
--   [[ Entry ]] = {}
--   [[ B ]] = { bind(B, Bp) | Bp in predecessors of B }
--
--   bind(B, Bp) = { Out(Bp) U
--                   predicate(label of leader B, terminator Bp) }
--
--   predicate(l, br(p, l, _)) = { p }
--   predicate(l, br(p, _, l)) = { !p }
--   predicate(_, _) = {}
--
--   Then, we use the result of solving the constraint system to
--   generate the proper instructions for those conditions, adding
--   them to their respective block. This step is accomplished by
--   calling fillBlocks with the result of withCond as a list.
bindCond
    :: Cfg.Node
    -> Cfg.Cfg
    -> Lang.IVar
    -> ([(Block.Block, [(Lang.Value, Lang.Label)])], Lang.IVar)
bindCond root cfg t = fillBlocks
    (Map.toList . withCond ctxs $ Map.singleton (Cfg.node root) [])
    t'
  where
    (ctx : ctxs) = Graph.bfs id root cfg
    bs'          = filter (Block.isMid . Block.label) $ map Cfg.block ctxs
    outList      = zip bs' $ iterate Lang.next t
    out          = Map.fromList outList
    t'           = if null outList then t else Lang.next . snd $ last outList

    withCond
        :: [Cfg.Context]
        -> Map.Map Block.Block [Cond]
        -> Map.Map Block.Block [Cond]
    withCond []           m = m
    withCond (ctx : ctxs) m = withCond ctxs
        $ bind (Cfg.block ctx) (map Cfg.node $ Graph.preds ctx) m

    fillBlocks
        :: [(Block.Block, [Cond])]
        -> Lang.IVar
        -> ([(Block.Block, [(Lang.Value, Lang.Label)])], Lang.IVar)
    fillBlocks [] t = ([], t)
    fillBlocks ((b, cs) : bs) t0
        | Block.isEntry $ Block.label b
        = let (bs', tj) = fillBlocks bs t0 in ((b, []) : bs', tj)
        | Block.isExit $ Block.label b
        = let
            -- Generate the instructions for the incoming conditions
              (is, cs', ti) = genIncoming b cs t0
              b' = b { Block.block = map (Nothing, ) is ++ Block.block b }
              (bs', tj) = fillBlocks bs ti
          in  ((b', cs') : bs', tj)
        | otherwise
        = let
              -- Generate the instructions for the incoming conditions
              (is, cs', ti) = genIncoming b cs t0
              -- Generate the instructions for the outgoing condition
              is'           = genOutgoing b $ map fst cs'
              -- Fill the block with both incoming and outgoing instructions
              b'            = b
                  { Block.block = map (Nothing, ) (is ++ is') ++ Block.block b
                  }
              (bs', tj) = fillBlocks bs ti
          in
              ((b', cs') : bs', tj)

    genIncoming
        :: Block.Block
        -> [Cond]
        -> Lang.IVar
        -> ([Lang.Inst], [(Lang.Value, Lang.Label)], Lang.IVar)
    genIncoming _ []       t  = ([], [], t)
    genIncoming b (c : cs) t0 = (is ++ is' ++ is'', c' : cs', tk)
      where
        foldValue
            :: ([Lang.Inst], [Lang.Value], Lang.IVar)
            -> Lang.Expr
            -> ([Lang.Inst], [Lang.Value], Lang.IVar)
        foldValue (is, vs, ti) e =
            let (is', v, tj) = toValue e ti in (is ++ is', v : vs, tj)

        -- Transform expressions of the form !v to some value v' with
        -- mov(v', !)
        (is, vs, ti) = foldl foldValue ([], [], t0) $ cond c
        (is', tj)    = fold (Lang.:&:) vs ti
        x            = case is' of
            [] -> head vs
            _  -> (\(Lang.Mov x _) -> Lang.Var x) $ last is'
        c'              = (x, from c)
        (is'', cs', tk) = genIncoming b cs tj

    genOutgoing :: Block.Block -> [Lang.Value] -> [Lang.Inst]
    genOutgoing b [v] = [Lang.Mov (show $ out Map.! b) $ Lang.Value v]
    genOutgoing b vs  = fst . fold (Lang.:|:) vs $ out Map.! b

    toValue :: Lang.Expr -> Lang.IVar -> ([Lang.Inst], Lang.Value, Lang.IVar)
    toValue e@(Lang.Not v) t = ([Lang.Mov id e], Lang.Var id, Lang.next t)
        where id = show t
    toValue (Lang.Value v) t = ([], v, t)

    bind
        :: Block.Block
        -> [Block.Block]
        -> Map.Map Block.Block [Cond]
        -> Map.Map Block.Block [Cond]
    bind _ []         m = m
    bind b (pr : prs) m = bind b prs $ Map.insert b (c : cs) m
      where
        -- Set of conditions already bound to block b
        cs = Map.findWithDefault [] b m
        -- Label of predecessor's leader
        l' = fromJust . fst $ Block.leader pr
        -- Label of current block's leader
        l  = fromJust . fst $ Block.leader b
        -- Terminator of the predecessor block
        i  = snd $ Block.terminator pr
        -- Predicate from Bp to B, given the terminator i
        p  = maybeToList $ predicate l i
        -- New condition to be bound to block b
        c  = Cond
            { cond = case Map.lookup pr out of
                         -- Predecessor hasn't an outgoing condition (the case for entry block)
                         Nothing -> p
                         Just t  -> (Lang.Value . Lang.Var $ show t) : p
            , from = l'
            }

    predicate :: Lang.Label -> Lang.Inst -> Maybe Lang.Expr
    predicate l (Lang.Br p lt _) =
        Just $ bool (Lang.Not p) (Lang.Value p) $ l == lt
    predicate _ _ = Nothing

transform
    :: Lang.Inst
    -> [Lang.Value]
    -> Map.Map Lang.Var Lang.Value
    -> Lang.IVar
    -> ([Lang.Inst], Map.Map Lang.Var Lang.Value, Lang.IVar)
transform i [] lastIdx var = ([i], lastIdx, var)
transform (Lang.Phi x selectors) cs lastIdx var0 =
    let
        neg :: [Lang.Value] -> Lang.IVar -> ([Lang.Inst], Lang.IVar)
        neg []  var = ([], var)
        neg [v] var = ([Lang.Mov t $ Lang.Neg v], Lang.next var)
            where t = show var
        neg (v : vs) var0 =
            let ([i], var1) = neg [v] var0
                (is , var2) = neg vs var1
            in  (i : is, var2)

        chainAnd
            :: [(Lang.Value, Lang.Value)]
            -> Lang.IVar
            -> ([Lang.Inst], Lang.IVar)
        chainAnd [] var = ([], var)
        chainAnd ((u, v) : vs) var0 =
            let (is , var1) = fold (Lang.:&:) [u, v] var0
                (is', var2) = chainAnd vs var1
            in  (is ++ is', var2)

        -- { mov(zi, -ci) | 0 <= i <= k } = Ineg
        (isNeg, var1) = neg cs var0

        -- { mov(zi', vi & zi) | 0 <= i <= k } = Iand
        (isAnd, var2) =
            chainAnd (zip (map snd selectors) $ Lang.defs isNeg) var1

        -- fold(|, defs(Iand)) => Ivalue
        (isOr, var3)      = fold (Lang.:|:) (Lang.defs isAnd) var2

        -- defs(Ivalue) => { z0'', ..., zn'' }
        (Lang.Mov zn'' _) = last isOr
    in
        ( isNeg ++ isAnd ++ isOr ++ [Lang.Mov x . Lang.Value $ Lang.Var zn'']
        , lastIdx
        , var3
        )
transform (Lang.Load x m idx) cs lastIdx var0 =
    let -- fold(&, C) => Iand
        (isAnd, var1)   = fold (Lang.:&:) cs var0

        -- defs(Iand) => { z0, ..., zk }
        (Lang.Mov zk _) = last isAnd

        -- L[m] = idx'
        idx'            = Map.findWithDefault (Lang.Const 0) m lastIdx

        -- { mov(z0', zk - 1), mov(z1', ~z0') } = Icond
        var2            = Lang.next var1
        z0'             = show var1
        z1'             = show var2
        isCond =
                [ Lang.Mov z0' $ Lang.Var zk Lang.:-: Lang.Const 1
                , Lang.Mov z1' . Lang.Not $ Lang.Var z0'
                ]

        -- { mov(z2', z0' & idx'), mov(z3', z1' & idx), mov(z4', z2' | z3') } = Iidx
        var3 = Lang.next var2
        var4 = Lang.next var3
        var5 = Lang.next var4
        z2'  = show var3
        z3'  = show var4
        z4'  = show var5
        isIdx =
                [ Lang.Mov z2' $ Lang.Var z0' Lang.:&: idx'
                , Lang.Mov z3' $ Lang.Var z1' Lang.:&: idx
                , Lang.Mov z4' $ Lang.Var z2' Lang.:|: Lang.Var z3'
                ]
    in  ( isAnd ++ isCond ++ isIdx ++ [Lang.Load x m $ Lang.Var z4']
        , Map.insert m (Lang.Var z4') lastIdx
        , Lang.next var5
        )
transform (Lang.Store v m idx) cs lastIdx var0 =
    let z0 = show var0

        -- <load(z0, m, idx), C, L> -->t (I U Icond U I', L')
        (isLoad, lastIdx', var1) =
                transform (Lang.Load z0 m idx) cs lastIdx $ Lang.next var0

        -- defs(Icond) => { z1, z2 }
        --
        -- |fold [v], [v0, v1]| = 1, else |cs|-1, so
        -- |Iload| = |I| ++ |Icond| + |I'|, where
        --   |Iand| = 1 if |cs| <= 2, |cs|-1 otherwise
        --   |Icond| = 2
        --
        -- Hence, Icond = Iload[|Iand| .. |Iand| + 1]
        n = if length cs <= 2 then 1 else length cs - 1
        [Lang.Mov z1 _, Lang.Mov z2 _] = take 2 $ drop n isLoad

        -- { mov(z3, z1 & z0), mov(z4, z2 & v), mov(z5, z3 | z4) } = Ivalue
        var2                           = Lang.next var1
        var3                           = Lang.next var2
        z3                             = show var1
        z4                             = show var2
        z5                             = show var3
        isValue =
                [ Lang.Mov z3 $ Lang.Var z1 Lang.:&: Lang.Var z0
                , Lang.Mov z4 $ Lang.Var z2 Lang.:&: v
                , Lang.Mov z5 $ Lang.Var z3 Lang.:|: Lang.Var z4
                ]

        -- L'[m] = idx'
        idx' = lastIdx' Map.! m
    in  ( isLoad ++ isValue ++ [Lang.Store (Lang.Var z5) m idx']
        , lastIdx'
        , Lang.next var3
        )
