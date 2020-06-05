-----------------------------------------------------------------------------
-- |
-- Module      :  Flow.DomTree
-- Copyright   :  (c) Luigi D. C. Soares 2020
-- License     :  GPL-3
--
-- Maintainer  :  luigidcsoares@gmail.com
-- Stability   :  experimental
-- Portability :  portable
----------------------------------------------------------------------------
module Flow.DomTree
    ( Node(..)
    , Context
    , Edge
    , DomTree
    , mkDomTree
    , dot
    )
where

import           Data.Maybe                     ( fromJust )
import           Data.Tuple                     ( swap )

import qualified Flow.Cfg                      as Cfg
import qualified Internal.Dot                  as Dot
import qualified Internal.Graph                as Graph
import           Core.Lang                      ( showStm )
import           Flow.Block                     ( Block(..) )

newtype Node = Node {node :: Block} deriving (Eq, Ord, Show)
instance Dot.Dot Node where
    label     = show . label . node
    stringify = unwords . map ((++ "\\l") . showStm) . block . node

type Context = Graph.Context Node
type Edge = Graph.Edge Node
type DomTree = Graph.Graph Node

mkDomTree :: Cfg.Node -> Cfg.Cfg -> DomTree
mkDomTree root cfg = Graph.mkGraph vs es
  where
    mkNode :: Cfg.Node -> Node
    mkNode     = Node . Cfg.block . fromJust . fst . (`Graph.match` cfg)
    (from, to) = unzip $ map swap $ Graph.iDom root cfg
    es         = zip (map mkNode from) (map mkNode to)
    vs         = Graph.dfs (Node . Cfg.block) root cfg

dot :: Node -> DomTree -> String
dot = Dot.dot (`Dot.formatNode` "") Dot.formatAdj "digraph \"Dominance Tree\" "
