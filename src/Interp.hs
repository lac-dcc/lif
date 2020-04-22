module Interp where

import           Control.Monad.Except
import           Data.Char
import           Data.Maybe
import           Data.Functor
import           Data.List.Split

import           Error
import           Eval
import           Lang
import           Parser

run :: String -> IO ()
run source = do
    parsed <- readProg source
    case parsed of
        Left  err  -> putStr (show err ++ "\n") $> ()
        Right prog -> putStr (interp prog) $> ()

interp :: Prog -> String
interp prog = go prog initState
  where
    go :: Prog -> State -> String
    go [] (_, _, _, _, out) = out
    go prog s@(_, _, _, pc, out)
        | pc >= length prog = out
        | otherwise = case eval prog s of
            Left  err -> show err ++ "\n"
            Right s'  -> go prog s'
