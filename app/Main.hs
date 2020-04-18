{-# LANGUAGE LambdaCase #-}

module Main where

import           System.Environment
import           Data.Char
import           Data.Functor

import           Interp

main :: IO ()
main = getArgs >>= \case
    [source] -> run source $> ()
