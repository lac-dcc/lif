{-# LANGUAGE TupleSections #-}
{-# LANGUAGE ViewPatterns #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Core.Eval
-- Copyright   :  (c) Luigi D. C. Soares 2020
-- License     :  GPL-3
--
-- Maintainer  :  luigidcsoares@gmail.com
-- Stability   :  experimental
-- Portability :  portable
----------------------------------------------------------------------------
module Core.Eval
    ( State
    , Reg
    , Mem
    , Buffer
    , PC
    , initState
    , evalProg
    , eval
    , evalExpr
    , evalValue
    )
where

import qualified Data.Map                      as Map
import qualified Data.Sequence                 as Seq
import           Control.Monad.Except           ( throwError )
import           Data.Bits                      ( (.|.)
                                                , (.&.)
                                                , shiftL
                                                , shiftR
                                                , complement
                                                )
import           Data.Bool                      ( bool )
import           Data.Functor                   ( ($>) )
import           Data.List                      ( elemIndex
                                                , find
                                                , intersect
                                                , (\\)
                                                )
import           Data.Maybe                     ( catMaybes
                                                , fromJust
                                                , fromMaybe
                                                )

import           Core.Error                     ( Error(..)
                                                , Throws
                                                )
import           Core.Lang                      ( Label
                                                , Var
                                                , Value(..)
                                                , Expr(..)
                                                , Inst(..)
                                                , Prog
                                                )

type Reg = Map.Map Var Integer
type Mem = Seq.Seq Integer
type Buffer = String
type PC = Int

-- | Reg, Mem, last seen label l' (predecessor block), current PC
--   and output buffer
type State = (Reg, Mem, Label, PC, Buffer)

initState :: State
initState = (Map.empty, Seq.empty, "", 0, "")

evalProg :: Prog -> State -> Throws State
evalProg prog s@(_, _, _, pc, _) | pc >= length prog = pure s
evalProg prog (eval prog -> err@Left{})              = err
evalProg prog (eval prog -> Right s'  )              = evalProg prog s'

-- | Evaluate the instruction pointed by PC.
eval :: Prog -> State -> Throws State
eval prog s@(reg, mem, l', pc, buffer) = case prog !! pc of
    (l, Alloc x e) -> either throwError (pure . nextState) $ evalExpr e reg
      where
        nextState v =
            ( Map.insert x (toInteger $ length mem) reg
            , mem Seq.>< Seq.replicate (fromInteger v) 0
            , fromMaybe l' l
            , pc + 1
            , buffer
            )
    (l, Mov x e) -> either throwError (pure . nextState) $ evalExpr e reg
      where
        nextState v = (Map.insert x v reg, mem, fromMaybe l' l, pc + 1, buffer)
    (l, Load x m idx) -> either throwError nextState $ evalValue (Var m) reg
      where
        load :: Integer -> Integer -> Reg
        load base offset =
            Map.insert x (Seq.index mem . fromInteger $ base + offset) reg

        nextState :: Integer -> Throws State
        nextState base =
            either
                    throwError
                    (pure . (, mem, fromMaybe l' l, pc + 1, buffer) . load base)
                $ evalValue idx reg
    (l, Store v m idx) ->
        either
                throwError
                (\base -> either throwError (nextState base) $ evalValue idx reg
                )
            $ evalValue (Var m) reg
      where
        store :: Integer -> Integer -> Integer -> Mem
        store base offset val =
            Seq.update (fromInteger $ base + offset) val mem

        nextState :: Integer -> Integer -> Throws State
        nextState base offset =
            either
                    throwError
                    ( pure
                    . (reg, , fromMaybe l' l, pc + 1, buffer)
                    . store base offset
                    )
                $ evalValue v reg
    (l, Phi x selectors) ->
        bool (throwError $ UndefLabel undef)
             (either throwError (pure . nextState) $ evalValue v reg)
            $ null undef
      where
        undef = map fst selectors \\ catMaybes
            (map (Just . fst) selectors `intersect` map fst prog)
        v = fromJust $ lookup l' selectors
        nextState v = (Map.insert x v reg, mem, fromMaybe l' l, pc + 1, buffer)
    (l, Jmp l1) ->
        maybe (throwError $ UndefLabel [l1]) (pure . nextState)
            $ find ((==) $ Just l1)
            $ map fst prog
        where nextState = (reg, mem, fromMaybe l' l, , buffer) . findPC prog
    (l, Br v l1 l2) ->
        bool (throwError $ UndefLabel undef)
             (either throwError (pure . nextState) $ evalValue v reg)
            $ null undef
      where
        undef =
            [l1, l2] \\ catMaybes ([Just l1, Just l2] `intersect` map fst prog)
        nextState =
            (reg, mem, fromMaybe l' l, , buffer)
                . findPC prog
                . Just
                . bool l1 l2
                . (== 0)
    (l, Out e) -> either throwError (pure . nextState) $ evalExpr e reg
      where
        nextState v =
            (reg, mem, fromMaybe l' l, pc + 1, buffer ++ show v ++ "\n")

evalExpr :: Expr -> Reg -> Throws Integer
evalExpr (Value v) reg = evalValue v reg
evalExpr (Neg   v) reg = negate <$> evalValue v reg
evalExpr (Not v) reg =
    either throwError (pure . bool 0 1 . (== 0)) $ evalValue v reg
evalExpr (BitNot v ) reg = complement <$> evalValue v reg
evalExpr (v1 :+: v2) reg = (+) <$> evalValue v1 reg <*> evalValue v2 reg
evalExpr (v1 :-: v2) reg = (-) <$> evalValue v1 reg <*> evalValue v2 reg
evalExpr (v1 :*: v2) reg = (*) <$> evalValue v1 reg <*> evalValue v2 reg
evalExpr (v1 :&: v2) reg = (.&.) <$> evalValue v1 reg <*> evalValue v2 reg
evalExpr (v1 :|: v2) reg = (.|.) <$> evalValue v1 reg <*> evalValue v2 reg
evalExpr (v1 :>>: v2) reg =
    shiftR <$> evalValue v1 reg <*> (fromInteger <$> evalValue v2 reg)
evalExpr (v1 :<<: v2) reg =
    shiftL <$> evalValue v1 reg <*> (fromInteger <$> evalValue v2 reg)
evalExpr (v1 :=: v2) reg =
    toInteger . fromEnum <$> ((==) <$> evalValue v1 reg <*> evalValue v2 reg)
evalExpr (v1 :!=: v2) reg =
    toInteger . fromEnum <$> ((/=) <$> evalValue v1 reg <*> evalValue v2 reg)
evalExpr (v1 :<: v2) reg =
    toInteger . fromEnum <$> ((<) <$> evalValue v1 reg <*> evalValue v2 reg)
evalExpr (v1 :>: v2) reg =
    toInteger . fromEnum <$> ((>) <$> evalValue v1 reg <*> evalValue v2 reg)
evalExpr (v1 :<=: v2) reg =
    toInteger . fromEnum <$> ((<=) <$> evalValue v1 reg <*> evalValue v2 reg)
evalExpr (v1 :>=: v2) reg =
    toInteger . fromEnum <$> ((>=) <$> evalValue v1 reg <*> evalValue v2 reg)

evalValue :: Value -> Reg -> Throws Integer
evalValue (Const n) _                        = pure n
evalValue (Var   x) (Map.lookup x -> Just v) = pure v
evalValue (Var   x) _                        = throwError $ UndefVar x

findPC :: Prog -> Maybe Label -> PC
findPC prog = fromJust . flip elemIndex (map fst prog)
