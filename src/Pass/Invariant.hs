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

-- | Takes a list of values and the next free variable, and
--   generates a set of instructions of the following form:
--
--       mov(t0, -v0)
--       mov(t1, -v1)
--       ...
--       mov(tn, -vn)
neg :: [Lang.Value] -> Lang.IVar -> ([Lang.Inst], Lang.IVar)
neg []  var = ([], var)
neg [v] var = ([Lang.Mov t $ Lang.Neg v], Lang.next var) where t = show var
neg (v : vs) var0 =
    let ([i], var1) = neg [v] var0
        (is , var2) = neg vs var1
    in  (i : is, var2)

-- | Takes a binary operator, a list of values and the next free
--   variable, and generates a set of instructions of the following
--   form:
--
--       mov(t0, v0 op v1)
--       mov(t1, t0 op v2)
--       mov(t2, t1 op v3)
--       ...
--       mov(tn, tn-1 op vn+1)
fold
    :: (Lang.Value -> Lang.Value -> Lang.Expr)
    -> [Lang.Value]
    -> Lang.IVar
    -> ([Lang.Inst], Lang.IVar)
fold _ []  var = ([], var)
fold _ [v] var = ([Lang.Mov t $ Lang.Value v], Lang.next var)
    where t = show var
fold op [v0, v1] var = ([Lang.Mov t $ v0 `op` v1], Lang.next var)
    where t = show var
fold op (v0 : v1 : vs) var0 =
    let t           = show var0
        ([i], var1) = fold op [v0, v1] var0
        (is , var2) = fold op (Lang.Var t : vs) var1
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
        chainAnd
            :: [(Lang.Value, Lang.Value)]
            -> Lang.IVar
            -> ([Lang.Inst], Lang.IVar)
        chainAnd [] var = ([], var)
        chainAnd ((u, v) : vs) var0 =
            let (is , var1) = fold (Lang.:&:) [u, v] var0
                (is', var2) = chainAnd vs var1
            in  (is ++ is', var2)

        (isNeg, var1) = neg cs var0
        (isAnd, var2) =
            chainAnd (zip (map snd selectors) $ Lang.defs isNeg) var1
        (isOr, var3)    = fold (Lang.:|:) (Lang.defs isAnd) var2
        (Lang.Mov tn _) = last isOr
    in
        ( isNeg ++ isAnd ++ isOr ++ [Lang.Mov x . Lang.Value $ Lang.Var tn]
        , lastIdx
        , var3
        )
transform (Lang.Load x m idx) cs lastIdx var0 =
    let (isAnd, var1)   = fold (Lang.:&:) cs var0
        (Lang.Mov xk _) = last isAnd
        t0              = show var1
        i0              = Lang.Mov t0 . Lang.Not $ Lang.Var xk
        (isNeg@[Lang.Mov y0 _, Lang.Mov y1 _], var2) =
                neg [Lang.Var xk, Lang.Var t0] $ Lang.next var1
        idx'  = Map.findWithDefault (Lang.Const 0) m lastIdx
        t1    = show var2
        i1    = Lang.Mov t1 $ Lang.Var y0 Lang.:&: idx
        var3  = Lang.next var2
        t2    = show var3
        i2    = Lang.Mov t2 $ Lang.Var y1 Lang.:&: idx'
        var4  = Lang.next var3
        t3    = show var4
        i3    = Lang.Mov t3 $ Lang.Var t2 Lang.:|: Lang.Var t1
        isIdx = [i1, i2, i3]
    in  ( isAnd ++ [i0] ++ isNeg ++ isIdx ++ [Lang.Load x m $ Lang.Var t3]
        , Map.insert m (Lang.Var t3) lastIdx
        , Lang.next var4
        )
transform (Lang.Store v m idx) cs lastIdx var0 =
    let t0 = show var0

        -- Call to transform(load(...), C) returns a set of
        -- instructions I of the following form:
        -- Iand U { mov(...) } U Ineg U Iidx U { load(...) }
        --
        -- |reduce [v], [v0, v1]| = 1, else |cs|-1, so
        -- |I| = |Iand| + 1 + |Ineg| + |Iidx| + 1, where
        --   |Iand| = 1 if |cs| <= 2, |cs|-1 otherwise
        --   |Iidx| = 3
        --   |Ineg| = 2
        --
        -- Hence, Ineg = I[|Iand| + 1 .. |Iand| + 2]
        (isLoad, lastIdx', var1) =
                transform (Lang.Load t0 m idx) cs lastIdx $ Lang.next var0
        n = if length cs <= 2 then 1 else length cs - 1
        [Lang.Mov x0 _, Lang.Mov x1 _] = take 2 $ drop (n + 1) isLoad
        t1                             = show var1
        i0                             = Lang.Mov t1 $ Lang.Var x0 Lang.:&: v
        var2                           = Lang.next var1
        t2                             = show var2
        i1 = Lang.Mov t2 $ Lang.Var x1 Lang.:&: Lang.Var t0
        var3                           = Lang.next var2
        t3                             = show var3
        i2 = Lang.Mov t3 $ Lang.Var t1 Lang.:|: Lang.Var t2
        isValue                        = [i0, i1, i2]
        idx'                           = lastIdx' Map.! m
    in  ( isLoad ++ isValue ++ [Lang.Store (Lang.Var t3) m idx']
        , lastIdx'
        , Lang.next var3
        )
