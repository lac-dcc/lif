{-# LANGUAGE LambdaCase #-}

module Main where

import           Data.Functor                   ( ($>) )
import           System.Environment             ( getArgs )

import qualified Flow.Cfg                      as Cfg
import qualified Flow.DomTree                  as DomTree
import           Core.Eval
import           Core.Lang
import           Core.Parser

main :: IO ()
main = getArgs >>= parse

parse :: [String] -> IO ()
parse ["-h"] =
    putStr
            (unlines
                [ "============================== Líf ==============================="
                , "-h\t\thelp"
                , "-r <file>\trun <file>"
                , "--cfg <file>\tgenerate the CFG and print it as DOT format"
                , "--dtree <file>\tsame as cfg but for the dominance tree"
                ]
            )
        $> ()
parse ["-r"     , file] = run file $> ()
parse ["--cfg"  , file] = cfg file $> ()
parse ["--dtree", file] = dtree file $> ()

run :: String -> IO ()
run source = readProg source >>= \case
    Left  err  -> putStr (show err ++ "\n") $> ()
    Right prog -> putStr (interp prog) $> ()

interp :: Prog -> String
interp prog = go prog initState
  where
    go :: Prog -> State -> String
    go prog s@(_, _, _, pc, out)
        | pc >= length prog = out
        | otherwise = case eval prog s of
            Left  err -> show err ++ "\n"
            Right s'  -> go prog s'

-- | Takes a file name, parses the code, generates the corresponding
--   cfg and prints it in DOT format
cfg :: String -> IO ()
cfg source = readProg source >>= \case
    Left  err  -> putStr (show err ++ "\n") $> ()
    Right prog -> do
        let (root, cfg) = Cfg.mkCfg prog
        putStrLn $ Cfg.dot root cfg
        pure ()

-- | Takes a file name, parses the code, generates the corresponding
--   dominance tree and prints it in DOT format
dtree source = readProg source >>= \case
    Left  err  -> putStr (show err ++ "\n") $> ()
    Right prog -> do
        let (root, cfg) = Cfg.mkCfg prog
        let tree        = DomTree.mkDomTree root cfg
        putStrLn $ DomTree.dot (DomTree.Node $ Cfg.node root) tree
        pure ()
