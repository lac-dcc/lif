module DomTree
    ( DomTree
    , mkDomTree
    , dot
    )
where

import qualified Data.Map                      as Map
import           Data.Tuple                     ( swap )
import           Data.List                      ( union )
import           Block
import           Cfg                            ( Cfg )
import           Internal.Graph
import           Lang

type DomTree = Graph Block

mkDomTree :: Node Block -> Cfg -> DomTree
mkDomTree entry cfg = mkGraph vs es  where
    es = map swap $ iDom entry cfg
    vs = map fst es `union` map snd es

dot :: Block -> DomTree -> String
dot entry tree =
    "digraph \"Dominance Tree\" {\n\n" ++ unlines (dfs format entry tree) ++ "}"
  where
    format :: Context Block -> String
    format ctx = formatNode (node ctx) ++ formatEdges (node ctx) (succs ctx)

    formatNode :: Node Block -> String
    formatNode (n, b) = unwords
        [ showBLabel n
        , "[shape=record,"
        , "label=\"{" ++ showBLabel n ++ ":\\l"
        , replaceOr . unwords $ map ((++ "\\l") . showStm) b
        , "}\"];\n"
        ]

    formatEdges :: Node Block -> Adj Block -> String
    formatEdges (n, stms) adj = unlines $ map
        ((showBLabel n ++) . (" -> " ++) . (++ ";") . showBLabel . fst)
        adj

    replaceOr :: String -> String
    replaceOr []          = []
    replaceOr ('|' : str) = "\\|" ++ replaceOr str
    replaceOr (c   : str) = c : replaceOr str
