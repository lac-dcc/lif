{-# LANGUAGE TupleSections #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Flow.Block
-- Copyright   :  (c) Luigi D. C. Soares 2020,
-- License     :  GPL-3
--
-- Maintainer  :  luigidcsoares@gmail.com
-- Stability   :  experimental
-- Portability :  portable
----------------------------------------------------------------------------
module Flow.Block
    ( Label(..)
    , Block(..)
    , isEntry
    , isExit
    , isMid
    , leader
    , terminator
    , findBlock
    , findLeader
    , fromProg
    )
where

import           Data.Maybe                     ( maybe )
import           Data.List                      ( find )

import qualified Internal.Dot                  as Dot
import qualified Core.Lang                     as Lang

-- | A label to either some intermediate block B, the entry or
--   the exit block.
data Label = Entry | Exit | Mid Int deriving (Eq, Ord)
instance Show Label where
    show Entry   = "Entry"
    show Exit    = "Exit"
    show (Mid n) = "B" ++ show n

isEntry :: Label -> Bool
isEntry Entry = True
isEntry _     = False

isExit :: Label -> Bool
isExit Exit = True
isExit _    = False

isMid :: Label -> Bool
isMid l = not (isEntry l) && not (isExit l)

-- | A basic block represented by a label and the block itself
data Block = Block {label :: Label, block :: [Lang.Stm] } deriving (Eq, Ord, Show)

leader :: Block -> Lang.Stm
leader = head . block

terminator :: Block -> Lang.Stm
terminator = last . block

findBlock :: Lang.Stm -> [Block] -> Maybe Block
findBlock leader = find ((== leader) . head . block)

findLeader :: Lang.Label -> [Block] -> Maybe Lang.Stm
findLeader l = fmap (Just l, ) . lookup (Just l) . toProg

toProg :: [Block] -> Lang.Prog
toProg = concatMap block

fromProg :: Lang.Prog -> [Block]
fromProg []                  = []
fromProg prog@(first : rest) = bs'
  where
    go :: Lang.Prog -> Int -> [Lang.Stm] -> [Block] -> [Block]
    go [] n b bs = reverse $ Block { label = Mid n, block = reverse b } : bs
    go (stm : stms) n b bs
        | isLeader prog stm
        = go stms (n + 1) [stm]
            $ Block { label = Mid n, block = reverse b }
            : bs
        | otherwise
        = go stms n (stm : b) bs

    (b : bs) = go rest 0 [first] []
    b'       = last bs
    bs'      = b { label = Entry } : init bs ++ [b' { label = Exit }]

isLeader :: Lang.Prog -> Lang.Stm -> Bool
isLeader prog stm@(l, i)
    |
    -- First statement of the program
      stm == head prog
    = True
    |
    -- First instruction following a br/jmp
      Lang.isControl . snd . head $ reverse $ takeWhile (/= stm) prog
    = True
    |
    -- There is some br/jmp moving the control to stm
      otherwise
    = let isLabUsed l = elem l . Lang.labelFrom $ map snd prog
      in  maybe False isLabUsed l
