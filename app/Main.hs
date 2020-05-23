{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ViewPatterns #-}

import           Data.Functor                   ( ($>) )
import           System.Environment             ( getArgs )

import qualified Flow.Cfg                      as Cfg
import qualified Flow.DomTree                  as DomTree
import           Core.Eval                      ( State
                                                , evalProg
                                                , initState
                                                )
import           Core.Lang                      ( Prog )
import           Core.Parser                    ( readProg )

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
    Right prog -> putStr (interp initState) $> ()
      where
        interp :: State -> String
        interp (evalProg prog -> Left err               ) = show err ++ "\n"
        interp (evalProg prog -> Right (_, _, _, _, out)) = out

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
