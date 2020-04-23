{-# LANGUAGE TupleSections #-}

module Cfg where

import           Data.Maybe
import           Data.List

import           Block
import           Internal.Graph
import           Lang

type Cfg = Graph Block

mkCfg :: Prog -> Cfg
mkCfg prog = mkGraph bs es
  where
    bs = fromProg prog
    es = concatMap (edges bs) bs

edges :: [Block] -> Block -> [Edge Block]
edges bs b' = case snd $ last b' of
    -- [... Jmp l] --> [l: ...]
    Jmp l -> [(b', b)]      where
        leader = (Just l, ) . fromJust $ lookup (Just l) (concat bs)
        b      = fromJust $ find ((== leader) . head) bs
    -- [... br _ l1 l2] --> [l1: ...] and [... br _ l1 l2] --> [l2: ...]
    Br _ l1 l2 -> zip [b', b'] $ map findBlock leaders      where
        findLeader l = (Just l, ) . fromJust $ lookup (Just l) (concat bs)
        findBlock leader = fromJust $ find ((== leader) . head) bs
        leaders = map findLeader [l1, l2]
    -- [... i_j] --> [i_(j+1) ...]
    _ -> case tail $ dropWhile (/= b') bs of
        []      -> []
        (b : _) -> [(b', b)]
