{-# LANGUAGE TupleSections #-}

module Flow.Block
    ( Block
    , findBlock
    , findLeader
    , fromProg
    , showLabel
    )
where

import           Data.Maybe                     ( maybe )
import           Data.List                      ( find )

import qualified Internal.Dot                  as Dot
import           Core.Lang

-- | A basic block represented by a label and the block itself
type Block = (Int, [Stm])

findBlock :: Stm -> [Block] -> Maybe Block
findBlock leader = find ((== leader) . head . snd)

findLeader :: Label -> [Block] -> Maybe Stm
findLeader l = fmap (Just l, ) . lookup (Just l) . toProg

toProg :: [Block] -> Prog
toProg = concatMap snd

fromProg :: Prog -> [Block]
fromProg []                  = []
fromProg prog@(first : rest) = go rest 0 [first] []
  where
    go :: Prog -> Int -> [Stm] -> [Block] -> [Block]
    go [] n b bs = reverse $ (n, reverse b) : bs
    go (stm : stms) n b bs
        | isLeader prog stm = go stms (n + 1) [stm] $ (n, reverse b) : bs
        | otherwise         = go stms n (stm : b) bs

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

showLabel :: Int -> String
showLabel = ("B" ++) . show
