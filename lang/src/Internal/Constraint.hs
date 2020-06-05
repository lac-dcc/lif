{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE ScopedTypeVariables #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Internal.Constraint
-- Copyright   :  (c) Luigi D. C. Soares 2020
-- License     :  GPL-3
--
-- Maintainer  :  luigidcsoares@gmail.com
-- Stability   :  experimental
-- Portability :  portable
----------------------------------------------------------------------------
module Internal.Constraint where

import qualified Data.Map                      as Map

-- | Solve a constraint system using chaotic iterations method.
--
--   Takes a queue of items to be analyzed, a function to be applied
--   to each item, and a map key x result corresponding to the initial
--   state, where result is an element of a (semi) lattice.
--
--   The function 'f' should return the updated map as well as a boolean
--   indicating whether some change happened or not.
--
--   Returns a final map after reaching a fixed point.
solve
    :: forall a b c
     . [a]
    -> (a -> Map.Map b c -> (Map.Map b c, Bool))
    -> Map.Map b c
    -> Map.Map b c
solve xs f = go xs []
  where
    go :: [a] -> [a] -> Map.Map b c -> Map.Map b c
    go [] _ m = m
    go (y : ys) ys' m | changed   = go (ys ++ y : ys') [] m'
                      | otherwise = go ys (y : ys') m'
        where (m', changed) = f y m
