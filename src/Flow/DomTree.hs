module Flow.DomTree
    ( Node(..)
    , Context
    , Edge
    , DomTree
    , mkDomTree
    , dot
    )
where

import qualified Data.Map                      as Map
import           Data.Bool                      ( bool )
import           Data.List                      ( union )
import           Data.Maybe                     ( fromJust )
import           Data.Tuple                     ( swap )
import           Prelude                 hiding ( and )

import qualified Flow.Cfg                      as Cfg
import qualified Internal.Dot                  as Dot
import qualified Internal.Graph                as Graph
import           Core.Lang
import           Flow.Block

newtype Node = Node {node :: Cfg.Context} deriving (Eq, Ord, Show)
instance Dot.Dot Node where
    label = showLabel . fst . Cfg.node . Graph.node . node
    stringify =
        unwords
            . map ((++ "\\l") . showStm)
            . snd
            . Cfg.node
            . Graph.node
            . node

type Context = Graph.Context Node
type Edge = Graph.Edge Node
type DomTree = Graph.Graph Node

mkDomTree :: Cfg.Context -> Cfg.Cfg -> DomTree
mkDomTree root cfg = Graph.mkGraph vs es
  where
    mkNode       = Node . fromJust . fst . (`Graph.match` cfg)
    (from , to ) = unzip $ map swap $ Graph.iDom (Graph.node root) cfg
    (from', to') = (map mkNode from, map mkNode to)
    vs           = from' `union` to'
    es           = zip from' to'

dot :: Node -> DomTree -> String
dot = Dot.dot (`Dot.formatNode` "") Dot.formatAdj "digraph \"Dominance Tree\" "
