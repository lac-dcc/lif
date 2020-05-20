{-# LANGUAGE ScopedTypeVariables #-}

module Internal.Graph
    ( Node
    , Edge
    , Adj
    , Context(..)
    , MContext
    , Graph(..)
    , Decomp
    , (>:)
    , gmap
    , gfoldr
    , mkGraph
    , match
    , toCtx
    , bfs
    , dfs
    , dom
    , iDom
    , topsort
    )
where

import qualified Data.Map                      as Map
import           Data.Bool                      ( bool )
import           Data.Maybe                     ( fromJust
                                                , fromMaybe
                                                , isNothing
                                                )
import           Data.List                      ( union
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

-- | Traverses a graph applying a function to each context.
gmap :: (Context a -> Context a) -> Graph a -> Graph a
gmap _ Empty      = Empty
gmap f (ctx :& g) = f ctx :& gmap f g

-- | Takes a graph g plus a initial list of contexts and
--   constructrs another graph g' merging g with the list.
gfoldr :: Graph a -> [Context a] -> Graph a
gfoldr = foldr (:&)


-- | Merges a context of a node u with a graph by adding u
--   as the predecessor of every node v in successors of u.
(>:) :: Eq a => Context a -> Graph a -> Graph a
(>:) ctx@Context { node = u, succs = su } = (:&) ctx . gmap
    (\ctx@Context { preds = pv, node = v } ->
        bool ctx ctx { preds = pv ++ [u] } $ v `elem` su && u `notElem` pv
    )
-- | Takes a list of nodes and edges connecting them, and returns
--   a graph with both predecessors and successors of each node
--   set.
mkGraph :: (Eq a, Show a) => [Node a] -> [Edge a] -> Graph a
mkGraph vs es = insEdges es $ insNodes vs Empty

insNodes :: [Node a] -> Graph a -> Graph a
insNodes =
    flip gfoldr . map (\v -> Context { preds = [], node = v, succs = [] })

insEdges :: forall a . (Eq a, Show a) => [Edge a] -> Graph a -> Graph a
insEdges es g = foldl insert g es
  where
    insert :: Graph a -> Edge a -> Graph a
    insert g (u, v) =
        let (mCtx, g') = match u g
            ctx        = fromMaybe
                (error $ "cannot add edge from nonexistent node " ++ show u)
                mCtx
        in  ctx { succs = succs ctx ++ [v] } >: g'

-- | Decomposes a graph into a MContext - Nothing if the node 'u'
--   wasn't found; otherwise, Just (ctx of 'u') - and the remaining
--   graph
match :: forall a . Eq a => Node a -> Graph a -> Decomp a
match u g = go [] g
  where
    go :: [Context a] -> Graph a -> Decomp a
    go _ Empty = (Nothing, g)
    go ctxs (ctx@Context { node = v } :& g)
        | u /= v    = go (ctx : ctxs) g
        | otherwise = (Just ctx, gfoldr g ctxs)

-- | Takes a graph and decomposes it into a list of contexts
toCtx :: Graph a -> [Context a]
toCtx Empty      = []
toCtx (ctx :& g) = ctx : toCtx g

-- | Takes a function to be applied to each context found, a initial
--   node and a graph, and return a list of values obtained after
--   applying the given funtion in the breadth-first search order.
bfs :: forall a b . Eq a => (Context a -> b) -> Node a -> Graph a -> [b]
bfs f start = go [start]
  where
    go :: [Node a] -> Graph a -> [b]
    go []       _     = []
    go _        Empty = []
    go (v : vs) g     = case match v g of
        (Nothing , g') -> go vs g'
        (Just ctx, g') -> f ctx : go (vs ++ succs ctx ++ preds ctx) g'

-- | Takes a function to be applied to each context found, a
--   initial node and a graph, and return a list of values
--   (obtained after applying the given funtion) in depth-first
--   search order.
dfs :: forall a b . Eq a => (Context a -> b) -> Node a -> Graph a -> [b]
dfs f start = go [start]
  where
    go :: [Node a] -> Graph a -> [b]
    go []       _     = []
    go _        Empty = []
    go (v : vs) g     = case match v g of
        (Nothing , g') -> go vs g'
        (Just ctx, g') -> f ctx : go (succs ctx ++ vs ++ preds ctx) g'

-- | Takes a Graph plus the initial node, and transforms it into
--   a list of contexts so we have a initial worklist. Then,
--   solves the following equations:
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

-- | A tree is defined as the current node + its subtrees
data Tree a = Tree a [Tree a]

-- | Takes a function to be applied to each context found, a
--   initial node and a graph, and return a list of values
--   (obtained after applying the given funtion) in reverse
--   post-order.
--
--   We first build a spanning forest for a given graph, and next
--   sort the nodes of each tree in postorder. The reverse
--   post-order is, then, the reverse of the list computed by
--   'postorder'.
topsort :: forall a b . Eq a => (Context a -> b) -> Node a -> Graph a -> [b]
topsort f start = reverse . concatMap postorder . fst . spanning [start]
  where
    spanning :: [Node a] -> Graph a -> ([Tree b], Graph a)
    spanning []       g = ([], g)
    spanning (v : vs) g = case match v g of
        (Nothing , g') -> spanning vs g'
        (Just ctx, g') -> (Tree (f ctx) ts : ts', g2)
          where
            -- Compute a forest ts for all successors of node v
            (ts , g1) = spanning (succs ctx) g'
            -- Compute a forest for the remaining nodes vs
            (ts', g2) = spanning vs g1

    postorder :: Tree b -> [b]
    postorder (Tree v ts) = concatMap postorder ts ++ [v]
