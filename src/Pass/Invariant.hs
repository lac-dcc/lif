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

-- | Takes the root node, the CFG and a fresh variable, and returns
--   a list of pairs (Block, C) plus the next fresh variable, where
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
--   Then, we use the result of the solving the constraint system
--   to generate the proper instructions for those conditions, adding
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
        (is', tj)    = reduce (Lang.:&:) vs ti
        x            = case is' of
            [] -> head vs
            _  -> (\(Lang.Mov x _) -> Lang.Var x) $ last is'
        c'              = (x, from c)
        (is'', cs', tk) = genIncoming b cs tj

    genOutgoing :: Block.Block -> [Lang.Value] -> [Lang.Inst]
    genOutgoing b [v] = [Lang.Mov (show $ out Map.! b) $ Lang.Value v]
    genOutgoing b vs  = fst . reduce (Lang.:|:) vs $ out Map.! b

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

-- | Takes a list of values and the next free variable, and
--   generates a set of instructions of the following form:
--
--       mov(t0, -v0)
--       mov(t1, -v1)
--       ...
--       mov(tn, -vn)
neg :: [Lang.Value] -> Lang.IVar -> ([Lang.Inst], Lang.IVar)
neg []  t = ([], t)
neg [v] t = ([Lang.Mov (show t) $ Lang.Neg v], Lang.next t)
neg (v : vs) t0 =
    let ([i], t1) = neg [v] t0
        (is , ti) = neg vs t1
    in  (i : is, ti)

-- | Takes a binary operator, a list of values and the next free
--   variable, and generates a set of instructions of the following
--   form:
--
--       mov(t0, v0 op v1)
--       mov(t1, t0 op v2)
--       mov(t2, t1 op v3)
--       ...
--       mov(tn, tn-1 op vn+1)
reduce
    :: (Lang.Value -> Lang.Value -> Lang.Expr)
    -> [Lang.Value]
    -> Lang.IVar
    -> ([Lang.Inst], Lang.IVar)
reduce _  []       t = ([], t)
reduce _  [v]      t = ([], t)
reduce op [v0, v1] t = ([Lang.Mov (show t) $ v0 `op` v1], Lang.next t)
reduce op (v0 : v1 : vs) t0 =
    let ([i], t1) = reduce op [v0, v1] t0
        (is , ti) = reduce op (Lang.Var (show t0) : vs) t1
    in  (i : is, ti)

-- | Takes a list of pairs Set of Instructions x Var, merges the set
--   of instructions and returns a single pair.
merge :: [([Lang.Inst], Lang.IVar)] -> ([Lang.Inst], Lang.IVar)
merge [(is, t)      ] = (is, t)
merge ((is, _) : iss) = let (iss', t) = merge iss in (is ++ iss', t)

transform :: Lang.Inst -> [Lang.Value] -> Lang.IVar -> ([Lang.Inst], Lang.IVar)
transform (Lang.Phi x selectors) cs t0 =
    let
        chainAnd
            :: Lang.IVar
            -> [(Lang.Value, Lang.Value)]
            -> [([Lang.Inst], Lang.IVar)]
        chainAnd _ [] = []
        chainAnd t0 ((u, v) : vs) =
            let (is, t1) = reduce (Lang.:&:) [u, v] t0
            in  (is, t1) : chainAnd t1 vs

        (isNeg, ti) = neg cs t0
        (isAnd, tm) =
            merge . chainAnd ti . zip (Lang.dv isNeg) $ map snd selectors
        (isOr, tn)       = reduce (Lang.:|:) (Lang.dv isAnd) tm
        (Lang.Mov tn' _) = last isOr
    in
        (isNeg ++ isAnd ++ isOr ++ [Lang.Mov x . Lang.Value $ Lang.Var tn'], tn)
