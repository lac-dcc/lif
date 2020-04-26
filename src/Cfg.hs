module Cfg
    ( Cfg
    , mkCfg
    , dot
    )
where

import           Data.Maybe                     ( fromJust )
import           Block
import           Internal.Graph
import           Lang

type Cfg = Graph Block

mkCfg :: Prog -> (Block, Cfg)
mkCfg prog = (head bs, mkGraph bs es)
  where
    bs = fromProg prog
    es = concatMap (edges bs) bs

dot :: Block -> Cfg -> String
dot entry cfg =
    "digraph \"CFG\" {\n\n" ++ unlines (dfs format entry cfg) ++ "}"
  where
    format :: Context Block -> String
    format ctx = formatNode (node ctx) ++ formatEdges (node ctx) (succs ctx)

    formatNode :: Node Block -> String
    formatNode (n, b) = case snd $ last b of
        Br{} -> unwords
            [ showBLabel n
            , "[shape=record,"
            , "label=\"{" ++ showBLabel n ++ ":\\l"
            , replaceOr . unwords $ map ((++ "\\l") . showStm) b
            , "|{<s0>F|<s1>T}}\"];\n"
            ]
        _ -> unwords
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

edges :: [Block] -> Block -> [Edge Block]
edges bs b@(_, stms) = case snd $ last stms of
    -- Jmp has only one successor
    Jmp l -> [(b, b')]
        where b' = fromJust . flip findBlock bs . fromJust $ findLeader l bs

    -- Br has two successors
    Br _ l1 l2 -> zip [b, b] $ map (fromJust . flip findBlock bs) leaders
        where leaders = map (fromJust . flip findLeader bs) [l1, l2]

    -- If the last instruction of b' is followed by some other instruction, then one edge
    _ -> case tail $ dropWhile (/= b) bs of
        []       -> []
        (b' : _) -> [(b, b')]
