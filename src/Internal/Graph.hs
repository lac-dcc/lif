{-# LANGUAGE ScopedTypeVariables #-}

module Internal.Graph
    ( Node
    , Edge
    , Adj
    , Context(..)
    , MContext
    , Graph(..)
    , Decomp
    , mkGraph
    , match
    , fromCtx
    , toCtx
    , bfs
    , dfs
    , dom
    , iDom
    )
where

import qualified Data.Map                      as Map
import           Data.Bool                      ( bool )
import           Data.Maybe                     ( fromJust
                                                , fromMaybe
                                                , isNothing
                                                )
import           Data.List                      ( foldl'
                                                , union
                                                , intersect
                                                , (\\)
                                                )

import           Internal.Constraint            ( solve )
import           Internal.Map                   ( fromMap )

type Node a = a
type Edge a = (Node a, Node a)

-- | Links to or from a node
type Adj a = [Node a]

-- | Links to the node (predecessors), the node itself and links
--   from the node (successors)
data Context a = Context { preds :: Adj a, node :: Node a, succs :: Adj a } deriving (Eq, Ord, Show)
type MContext a = Maybe (Context a)

data Graph a = Empty | Context a :& Graph a deriving (Show)

-- | Graph decomposition - the context extracted from a graph, plus
--   the remaining graph
type Decomp a = (MContext a, Graph a)

-- | A node 'u' plus the set of nodes that dominates 'u' (including 'u' itself).
type Dom a = (Node a, Adj a)

-- | A node 'u' plus its immediate dominator 'v', with 'v' != 'u'.
type IDom a = (Node a, Node a)

-- | Takes a list of nodes and edges connecting them, and returns
--   a graph with both predecessors and successors of each node set
mkGraph :: (Eq a, Show a) => [Node a] -> [Edge a] -> Graph a
mkGraph vs es = insEdgesRev es $ insEdges es $ insNodes vs Empty

insNode :: Node a -> Graph a -> Graph a
insNode v = (:&) Context { preds = [], node = v, succs = [] }

insEdge :: (Eq a, Show a) => Edge a -> Graph a -> Graph a
insEdge (u, v) g = ctx { succs = v : succs ctx } :& g'
  where
    (mCtx, g') = match u g
    ctx        = fromMaybe
        (error $ "cannot add edge from nonexistent node " ++ show u)
        mCtx

insEdgeRev :: (Eq a, Show a) => Edge a -> Graph a -> Graph a
insEdgeRev (u, v) g = ctx { preds = u : preds ctx } :& g'
  where
    (mCtx, g') = match v g
    ctx        = fromMaybe
        (error $ "cannot add edge from nonexistent node " ++ show v)
        mCtx

insNodes :: [Node a] -> Graph a -> Graph a
insNodes vs g = foldl' (flip insNode) g vs

insEdges :: (Eq a, Show a) => [Edge a] -> Graph a -> Graph a
insEdges es g = foldl' (flip insEdge) g es

insEdgesRev :: (Eq a, Show a) => [Edge a] -> Graph a -> Graph a
insEdgesRev es g = foldl' (flip insEdgeRev) g es

-- | Decomposes a graph into a MContext - Nothing if the node 'u'
--   wasn't found; otherwise, Just (ctx of 'u') - and the remaining
--   graph
match :: forall a . Eq a => Node a -> Graph a -> Decomp a
match u = go []
  where
    go :: [Context a] -> Graph a -> Decomp a
    go _ Empty = (Nothing, Empty)
    go accum (ctx@Context { node = v } :& g)
        | u /= v    = go (ctx : accum) g
        | otherwise = (Just ctx, fromCtx $ accum ++ toCtx g)

-- | Takes a list of contexts and transforms it into a graph
fromCtx :: [Context a] -> Graph a
fromCtx = foldr (:&) Empty

-- | Takes a graph and decomposes it into a list of contexts
toCtx :: Graph a -> [Context a]
toCtx Empty      = []
toCtx (ctx :& g) = ctx : toCtx g

-- | Takes a function to be applied to each context found, a initial
--   node and a graph, and return a list of values obtained after
--   applying the given funtion in the breadth-first search order.
bfs :: forall a b . Eq a => (Context a -> b) -> Node a -> Graph a -> [b]
bfs f start g = case match start g of
    (Nothing , Empty) -> []
    (Just ctx, g'   ) -> go f [start] $ ctx :& g'
  where
    go :: Eq a => (Context a -> b) -> [Node a] -> Graph a -> [b]
    go _ []       _ = []
    go f (v : vs) g = case match v g of
        (Nothing , Empty) -> go f vs g
        (Just ctx, g'   ) -> f ctx : go f (vs ++ succs ctx) g'

-- | Takes a function to be applied to each context found, a initial
--   node and a graph, and return a list of values obtained after
--   applying the given funtion in the depth-first search order.
dfs :: forall a b . Eq a => (Context a -> b) -> Node a -> Graph a -> [b]
dfs f start g = case match start g of
    (Nothing , Empty) -> []
    (Just ctx, g'   ) -> go f [start] $ ctx :& g'
  where
    go :: Eq a => (Context a -> b) -> [Node a] -> Graph a -> [b]
    go _ []       _ = []
    go f (v : vs) g = case match v g of
        (Nothing , Empty) -> go f vs g
        (Just ctx, g'   ) -> f ctx : go f (succs ctx ++ vs) g'

-- | Takes a Graph plus the initial node, and transforms it into
--   a list of contexts so we have a initial worklist. Then, solves
--   the following equations:
--
--           Dom(root) = {root}
--           Dom(v) = {v} U (intersection Dom(p), p in preds of v)
--
--   Returns a map between a node and its dom.
dom :: forall a . (Eq a, Ord a) => Node a -> Graph a -> [Dom a]
dom root g
    | isNothing mCtx
    = []
    | otherwise
    = let
          ctxs = toCtx g'
          vs   = map node ctxs

          -- The initial state is given by the following equations:
          --     Dom(root) = {root}
          --     Dom(v) = S
          -- where S is a set containing all nodes.
          initState =
              Map.insert root [root]
                  . Map.fromList
                  . zip vs
                  . repeat
                  $ root
                  : vs

          f
              :: Context a
              -> Map.Map (Node a) (Adj a)
              -> (Map.Map (Node a) (Adj a), Bool)
          f Context { preds = pr, node = v } dom =
              let dom' = Map.insert v ([v] `union` meet) dom
                  meet = foldr1 intersect $ fromMap pr dom
              in  (dom', dom Map.! v /= dom' Map.! v)
      in
          Map.toList $ solve ctxs f initState
    where (mCtx, g') = match root g

-- | Takes a Graph plus the initial node, and transforms it into
--   a list of pairs node 'v' x immediate dominator 'u', where
--   'u' is unique and u != v.
iDom :: forall a . (Eq a, Ord a) => Node a -> Graph a -> [IDom a]
iDom root g = go doms $ Map.fromList doms
  where
    -- Filter the set of nodes that dominates a node 'u' in order
    -- to get only the nodes that strictly dominates 'u'.
    doms = map (\(u, doms) -> (u, filter (/= u) doms)) $ dom root g

    go :: [Dom a] -> Map.Map (Node a) (Adj a) -> [IDom a]
    go [] _ = []
    go ((u, domU) : doms) domMap =
        case (domU \\) . concat $ fromMap domU domMap of
            []  -> go doms domMap
            [v] -> (u, v) : go doms domMap
