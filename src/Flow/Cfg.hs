module Flow.Cfg
    ( Node(..)
    , Adj
    , Context
    , Edge
    , Cfg
    , block
    , mkCfg
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
mkCfg prog = (root, cfg)
  where
    bs            = Block.fromProg prog
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

    -- If the last instruction of b' is followed by some other instruction, then one edge
    _ -> case tail $ dropWhile (/= v) vs of
        []       -> []
        (v' : _) -> [(v, v')]
    where bs = map node vs
