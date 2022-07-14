{-# LANGUAGE ScopedTypeVariables #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Internal.Map
-- Copyright   :  (c) Luigi D. C. Soares 2020
-- License     :  GPL-3
--
-- Maintainer  :  luigidcsoares@gmail.com
-- Stability   :  experimental
-- Portability :  portable
----------------------------------------------------------------------------
module Internal.Map
    ( fromMap
    )
where

import           Data.Map                       ( Map
                                                , foldrWithKey
                                                )
import           Data.Bool                      ( bool )

-- | Takes a list of keys and a map, and returns a list of values
--   corresponding to these keys.
fromMap :: forall a b . Ord a => [a] -> Map a b -> [b]
fromMap keys =
    foldrWithKey (\k v accum -> bool accum (v : accum) $ k `elem` keys) []
