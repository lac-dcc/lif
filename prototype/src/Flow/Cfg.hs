-----------------------------------------------------------------------------
-- |
-- Module      :  Flow.Cfg
-- Copyright   :  (c) Luigi D. C. Soares 2020
-- License     :  GPL-3
--
-- Maintainer  :  luigidcsoares@gmail.com
-- Stability   :  experimental
-- Portability :  portable
----------------------------------------------------------------------------
module Flow.Cfg
    ( Node(..)
    , Adj
    , Context
    , Edge
    , Cfg
    , block
    , edges
    , mkCfg
    , fromBlocks
    , dot
    )
where

import           Data.Maybe                     ( fromJust )

import qualified Flow.Block                    as Block
import qualified Internal.Dot                  as Dot
import qualified Internal.Graph                as Graph
import           Core.Lang                      ( Inst(..)
                                                , Prog
                                                , showStm
                                                )

newtype Node = Node {node :: Block.Block} deriving (Eq, Ord, Show)
instance Dot.Dot Node where
    label     = show . Block.label . node
    stringify = unwords . map ((++ "\\l") . showStm) . Block.block . node

type Adj = Graph.Adj Node
type Context = Graph.Context Node
type Edge = Graph.Edge Node
type Cfg = Graph.Graph Node

block :: Context -> Block.Block
block = node . Graph.node

mkCfg :: Prog -> (Node, Cfg)
mkCfg = fromBlocks . Block.fromProg

fromBlocks :: [Block.Block] -> (Node, Cfg)
fromBlocks bs = (root, cfg)
  where
    vs@(root : _) = map Node bs
    es            = concatMap (edges vs) vs
    cfg           = Graph.mkGraph vs es

dot :: Node -> Cfg -> String
dot = Dot.dot formatNode Dot.formatAdj "digraph \"CFG\" "
  where
    formatNode :: Node -> String
    formatNode v = Dot.formatNode v $ case snd . Block.terminator $ node v of
        Br{} -> " | {F|T}"
        _    -> ""

edges :: [Node] -> Node -> [Edge]
edges vs v@(Node b) = case snd $ Block.terminator b of
    -- Jmp has only one successor
    Jmp l -> [(v, v')]
      where
        v' =
            Node
                . fromJust
                . flip Block.findBlock bs
                . fromJust
                $ Block.findLeader l bs

    -- Br has two successors
    Br _ l1 l2 -> zip [v, v]
        $ map (Node . fromJust . flip Block.findBlock bs) leaders
        where leaders = map (fromJust . flip Block.findLeader bs) [l1, l2]

    -- No terminator => exit block
    _ -> []
    where bs = map node vs
