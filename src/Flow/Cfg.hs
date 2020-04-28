module Flow.Cfg
    ( Node(..)
    , Context
    , Edge
    , Cfg
    , mkCfg
    , dot
    )
where

import           Data.Maybe                     ( fromJust )

import qualified Internal.Dot                  as Dot
import qualified Internal.Graph                as Graph
import           Core.Lang
import           Flow.Block

newtype Node = Node {node :: Block} deriving (Eq, Ord, Show)
instance Dot.Dot Node where
    label     = showLabel . fst . node
    stringify = unwords . map ((++ "\\l") . showStm) . snd . node

type Context = Graph.Context Node
type Edge = Graph.Edge Node
type Cfg = Graph.Graph Node

mkCfg :: Prog -> (Context, Cfg)
mkCfg prog = (fromJust . fst $ Graph.match root cfg, cfg)
  where
    bs            = fromProg prog
    vs@(root : _) = map Node bs
    es            = concatMap (edges vs) vs
    cfg           = Graph.mkGraph vs es

dot :: Context -> Cfg -> String
dot root = Dot.dot formatNode
                   Dot.formatAdj
                   "digraph \"CFG\" "
                   (Graph.node root)
  where
    formatNode :: Node -> String
    formatNode v = Dot.formatNode v $ case snd . last . snd $ node v of
        Br{} -> " | {F|T}"
        _    -> ""

edges :: [Node] -> Node -> [Edge]
edges vs v@(Node (_, stms)) = case snd $ last stms of
    -- Jmp has only one successor
    Jmp l -> [(v, v')]
      where
        v' = Node . fromJust . flip findBlock bs . fromJust $ findLeader l bs

    -- Br has two successors
    Br _ l1 l2 -> zip [v, v]
        $ map (Node . fromJust . flip findBlock bs) leaders
        where leaders = map (fromJust . flip findLeader bs) [l1, l2]

    -- If the last instruction of b' is followed by some other instruction, then one edge
    _ -> case tail $ dropWhile (/= v) vs of
        []       -> []
        (v' : _) -> [(v, v')]
    where bs = map node vs
