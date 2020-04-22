module Block where

import           Data.List
import           Data.Maybe

import           Lang

type Block = [Stm]

fromProg :: Prog -> [Block]
fromProg []                  = []
fromProg prog@(first : rest) = go rest [first] []
  where
    go :: Prog -> Block -> [Block] -> [Block]
    go [] b bs = reverse $ reverse b : bs
    go (stm : stms) b bs | isLeader prog stm = go stms [stm] $ reverse b : bs
                         | otherwise         = go stms (stm : b) bs

isLeader :: Prog -> Stm -> Bool
isLeader prog stm@(l, i)
    |
    -- First statement of the program
      stm == head prog
    = True
    |
    -- First instruction following a br/jmp
      isControl . snd . head $ reverse $ takeWhile (/= stm) prog
    = True
    |
    -- There is some br/jmp moving the control to stm
      otherwise
    = let isLabUsed l = elem l . labelFrom $ map snd prog
      in  maybe False isLabUsed l

