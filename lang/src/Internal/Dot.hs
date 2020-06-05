-----------------------------------------------------------------------------
-- |
-- Module      :  Internal.Dot
-- Copyright   :  (c) Luigi D. C. Soares 2020
-- License     :  GPL-3
--
-- Maintainer  :  luigidcsoares@gmail.com
-- Stability   :  experimental
-- Portability :  portable
----------------------------------------------------------------------------
module Internal.Dot
    ( Dot(..)
    , formatNode
    , formatAdj
    , formatCtx
    , dot
    , replaceOr
    )
where

import           Internal.Graph                 ( Node
                                                , Adj
                                                , Context(..)
                                                , Graph(..)
                                                , dfs
                                                )

class Dot a where
  -- | Takes a node and returns a label representing it.
  label :: Node a -> String

  -- | Takes a node and returns a stringified node formatted
  --   as dot record.
  stringify :: Node a -> String

-- | Takes a node plus and extra info (e.g. F | T), and generates
--   a dot representation with shape=record.
formatNode :: Dot a => a -> String -> String
formatNode v extra =
    label v
        ++ " [shape=record, label=\"{"
        ++ label v
        ++ ":\\l "
        ++ replaceOr (stringify v)
        ++ extra
        ++ "}\"];\n"

-- | Takes a node and a list of adj nodes, and transforms them
--   into dot edges.
formatAdj :: Dot a => Node a -> Adj a -> String
formatAdj v adj =
    unlines $ map ((label v ++) . (" -> " ++) . (++ ";") . label) adj

-- | Takes a context, a transform fn for nodes and a transform fn
--   for edgess, and transforms it into dot representation
--   (default node + edges).
formatCtx
    :: (Node a -> String) -> (Node a -> Adj a -> String) -> Context a -> String
formatCtx fn fa ctx = fn (node ctx) ++ fa (node ctx) (succs ctx)

-- | Takes a header, a root node plus a graph, a transform fn for
--   nodes and a transform fn for edges, and transform them into a
--   dot representation of the entire graph.
dot
    :: Eq a
    => (Node a -> String)
    -> (Node a -> Adj a -> String)
    -> String
    -> Node a
    -> Graph a
    -> String
dot fn fa header root g =
    header ++ "{\n\n" ++ unlines (dfs (formatCtx fn fa) root g) ++ "}"

-- | Takes a string and replace all occurrences of the vertical bar (or)
--   character since '|' is a special character in dot language.
replaceOr :: String -> String
replaceOr []          = []
replaceOr ('|' : str) = "\\|" ++ replaceOr str
replaceOr (c   : str) = c : replaceOr str
