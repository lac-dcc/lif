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
    )
where

import           Data.Maybe
import           Data.List

type Node a = a
type Edge a = (Node a, Node a)

-- | Links to or from a node
type Adj a = [Node a]

-- | Links to the node (predecessors), the node itself and
--   links from the node (successors)
data Context a = Context { preds :: Adj a, node :: Node a, succs :: Adj a } deriving (Show)
type MContext a = Maybe (Context a)

-- | Inductive graph
data Graph a = Empty | Context a :& Graph a deriving (Show)

-- | Graph decomposition - the context remove from a graph, 
--   plus the remaining graph
type Decomp a = (MContext a, Graph a)

mkGraph :: (Eq a, Show a) => [Node a] -> [Edge a] -> Graph a
mkGraph vs es = insEdges es $ insNodes vs Empty

-- | 'match' decompose a graph into a MContext - Nothing if
--   the node 'u' wasn't found; otherwise, Just 'u' - and the
--   remaining graph
match :: forall a . Eq a => Node a -> Graph a -> Decomp a
match u = go []
  where
    go :: Eq a => [Context a] -> Graph a -> Decomp a
    go _ Empty = (Nothing, Empty)
    go accum (ctx@(Context _ v _) :& g)
        | u /= v    = go (ctx : accum) g
        | otherwise = (Just ctx, fromCtx $ reverse accum ++ toCtx g)

insNode :: Node a -> Graph a -> Graph a
insNode v = (:&) Context { preds = [], node = v, succs = [] }

insEdge :: (Eq a, Show a) => Edge a -> Graph a -> Graph a
insEdge (u, v) g =
    ctxU { succs = v : succsU } :& (ctxV { preds = u : predsV } :& g'')
  where
    (mCtxU, g')                    = match u g
    ctxU@(Context predsU _ succsU) = fromMaybe
        (error $ "cannot add edge from nonexistent node " ++ show u)
        mCtxU

    (mCtxV, g'')                   = match v g'
    ctxV@(Context predsV _ succsV) = fromMaybe
        (error $ "cannot add edge from nonexistent node " ++ show v)
        mCtxV

insNodes :: [Node a] -> Graph a -> Graph a
insNodes vs g = foldl' (flip insNode) g vs

insEdges :: (Eq a, Show a) => [Edge a] -> Graph a -> Graph a
insEdges es g = foldl' (flip insEdge) g es

fromCtx :: [Context a] -> Graph a
fromCtx = foldr (:&) Empty

toCtx :: Graph a -> [Context a]
toCtx Empty      = []
toCtx (ctx :& g) = ctx : toCtx g
