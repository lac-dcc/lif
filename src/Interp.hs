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
    parsed <- parseProg source
    case parsed of
        Left  err  -> putStr (show err ++ "\n") $> ()
        Right stms -> interp (withLabel stms) $> ()

interp :: Prog -> IO ()
interp prog@((first, _) : _) = single prog (initState first) $> ()
  where
    single :: Prog -> State -> IO State
    single [] s                 = pure s
    single _  s@(_, _, Nothing) = pure s
    single prog s@(_, _, Just l) =
        case evalInst (fromJust $ lookup l prog) prog s of
            Left  err               -> putStr (show err ++ "\n") $> s
            Right (Nothing    , s') -> single prog s'
            Right (Just output, s') -> putStr output *> single prog s'
