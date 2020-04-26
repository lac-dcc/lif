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
    , dfs
    )
where

import           Data.Maybe                     ( fromMaybe )
import           Data.List                      ( foldl' )

type Node a = a
type Edge a = (Node a, Node a)

-- | Links to or from a node
type Adj a = [Node a]

-- | Links to the node (predecessors), the node itself and links
--   from the node (successors)
data Context a = Context { preds :: Adj a, node :: Node a, succs :: Adj a } deriving (Show)
type MContext a = Maybe (Context a)

data Graph a = Empty | Context a :& Graph a deriving (Show)

-- | Graph decomposition - the context extracted from a graph, plus
--   the remaining graph
type Decomp a = (MContext a, Graph a)

-- | Takes a list of nodes and edges connecting them, and returns
--   a graph with both predecessors and successors of each node set
mkGraph :: (Eq a, Show a) => [Node a] -> [Edge a] -> Graph a
mkGraph vs es = insEdgesRev es $ insEdges es $ insNodes vs Empty

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
        | otherwise = (Just ctx, fromCtx $ reverse accum ++ toCtx g)

-- | Takes a list of contexts and transforms it into a graph
fromCtx :: [Context a] -> Graph a
fromCtx = foldr (:&) Empty

-- | Takes a graph and decomposes it into a list of contexts
toCtx :: Graph a -> [Context a]
toCtx Empty      = []
toCtx (ctx :& g) = ctx : toCtx g

-- | Takes a function to be applied to each context found, a initial
--   node and a graph, and return a list of values obtained after
--   applying the given funtion
dfs :: forall a b . Eq a => (Context a -> b) -> Node a -> Graph a -> [b]
dfs f start g = case match start g of
    (Nothing , Empty) -> []
    (Just ctx, g'   ) -> dfs' f [start] $ ctx :& g'

-- | Internal implementation of the depth-first search functional algorithm
dfs' :: Eq a => (Context a -> b) -> [Node a] -> Graph a -> [b]
dfs' _ []       _ = []
dfs' f (v : vs) g = case match v g of
    (Nothing , Empty) -> dfs' f vs g
    (Just ctx, g'   ) -> f ctx : dfs' f (succs ctx ++ vs) g'

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
