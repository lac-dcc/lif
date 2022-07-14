{-# LANGUAGE DeriveGeneric #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Main
-- Copyright   :  (c) Luigi D. C. Soares 2020
-- License     :  GPL-3
--
-- Maintainer  :  luigidcsoares@gmail.com
-- Stability   :  experimental
-- Portability :  portable
--
-- This module contains tests primarily related to the invariant pass.
----------------------------------------------------------------------------
module Main where
import qualified Data.ByteString.Lazy          as BS
import qualified Data.Map                      as Map
import           Data.Aeson                     ( FromJSON
                                                , eitherDecode
                                                )
import           Data.Bool                      ( bool )

import           GHC.Generics                   ( Generic )
import           Test.Hspec                     ( Spec
                                                , hspec
                                                , describe
                                                , it
                                                , shouldBe
                                                )

import           Core.Eval                      ( State
                                                , Reg
                                                , Mem
                                                , evalProg
                                                , evalValue
                                                )
import           Core.Lang                      ( IVar(..)
                                                , Var
                                                , Value(..)
                                                , Prog
                                                )
import           Core.Parser                    ( readProg )
import           Flow.Block                     ( block )
import           Flow.Cfg                       ( mkCfg )
import           Pass.Invariant                 ( transformProg )

main :: IO ()
main = go tests
  where
    go :: [(FilePath, FilePath)] -> IO ()
    go []       = pure ()
    go (t : ts) = runTest t *> go ts

data Meta = Meta { name :: String, params :: Reg, mem :: [Mem] } deriving (Show, Generic)
instance FromJSON Meta

mkStates :: Meta -> [State]
mkStates Meta { params = reg, mem = mem } = [ (reg, m, "", 0, "") | m <- mem ]

tests :: [(FilePath, FilePath)]
tests = [("test/comp.lif", "test/comp.json"), ("test/mu.lif", "test/mu.json")]

fromJSON :: FilePath -> IO (Either String Meta)
fromJSON = fmap eitherDecode . BS.readFile

runTest :: (FilePath, FilePath) -> IO ()
runTest (src, json) = do
    (Right prog) <- readProg src
    (Right meta) <- fromJSON json
    hspec $ describe (name meta) $ go prog (mkStates meta) 1
  where
    go :: Prog -> [State] -> Int -> Spec
    go _    []       _ = pure ()
    go prog (s : ss) n = do
        let ((reg, mem, _, _, _), (reg', mem', _, _, _)) = run prog s

        -- Here, "equivalent" means that every variable def.
        -- when running the original program should also be
        -- def. when running the transformed program and should
        -- have the same value at the end of the execution.
        --
        -- Also, the memory state should be the same at the end of
        -- the execution.
        it ("produces equivalent states for input " ++ show n)
            $          (reg `Map.isSubmapOf` reg' && mem == mem')
            `shouldBe` True

        go prog ss (n + 1)

-- | Takes an original program, transforms it to an invariant
--   version and evaluates both the original and the transformed
run :: Prog -> State -> (State, State)
run progO s =
    let (root, cfg) = mkCfg progO
        (bs  , _  ) = transformProg root cfg $ IVar 0
        progT       = concatMap block bs
        -- Final state produced when running the original code
        (Right so)  = evalProg progO s
        -- Final state produced when running the transformed code
        (Right st)  = evalProg progT s
    in  (so, st)
