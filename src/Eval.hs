{-# LANGUAGE TupleSections #-}

module Eval where

import           Control.Monad.Except
import           Data.Bits
import           Data.Bool
import           Data.Either
import           Data.List
import           Data.Functor
import           Data.Maybe
import qualified Data.Map                      as Map
import qualified Data.Sequence                 as Seq

import           Error
import           Lang

type Reg = Map.Map Var Integer
type Mem = Seq.Seq Integer
type Buffer = String
type PC = Int

-- Reg, Mem, previous PC, current PC and output buffer
type State = (Reg, Mem, PC, PC, Buffer)

-- Walk backwards searching for a label
findLabel :: Prog -> PC -> Label
findLabel prog pc =
    fromJust . fst . head . dropWhile (isNothing . fst) . reverse $ take
        (pc + 1)
        prog

initState :: State
initState = (Map.empty, Seq.empty, -1, 0, "")

findPC :: Prog -> Maybe Label -> PC
findPC prog = fromJust . flip elemIndex (map fst prog)

eval :: Prog -> State -> Throws State
eval prog s@(reg, mem, pc', pc, buffer) = case snd (prog !! pc) of
    (Alloc x e) -> either throwError (pure . nextState) $ evalExpr e reg
      where
        nextState =
            (Map.insert x (toInteger $ length mem) reg, , pc, pc + 1, buffer)
                . (mem Seq.><)
                . flip Seq.replicate 0
                . fromInteger
    (Mov x e) -> either throwError (pure . nextState) $ evalExpr e reg
        where nextState v = (Map.insert x v reg, mem, pc, pc + 1, buffer)
    (Load x e) -> either throwError (pure . nextState) $ evalExpr e reg
      where
        nextState v =
            ( Map.insert x (Seq.index mem $ fromInteger v) reg
            , mem
            , pc
            , pc + 1
            , buffer
            )
    (Store e1 e2) ->
        either
                throwError
                (\v -> either throwError (pure . nextState v) $ evalExpr e2 reg)
            $ evalExpr e1 reg
      where
        nextState v idx =
            (reg, , pc, pc + 1, buffer) $ Seq.update (fromInteger idx) v mem
    (Phi x phi) ->
        bool (throwError $ UndefLabel undef)
             (either throwError (pure . nextState) $ evalValue v reg)
            $ null undef
      where
        undef = map fst phi
            \\ catMaybes (map (Just . fst) phi `intersect` map fst prog)
        v = fromJust $ lookup (findLabel prog pc') phi
        nextState v = (Map.insert x v reg, mem, pc, pc + 1, buffer)
    (Jmp l) ->
        maybe (throwError $ UndefLabel [l]) (pure . nextState)
            $ find ((==) $ Just l)
            $ map fst prog
        where nextState = (reg, mem, pc, , buffer) . findPC prog
    (Br e l1 l2) ->
        bool (throwError $ UndefLabel undef)
             (either throwError (pure . nextState) $ evalExpr e reg)
            $ null undef
      where
        undef =
            [l1, l2] \\ catMaybes ([Just l1, Just l2] `intersect` map fst prog)
        nextState =
            (reg, mem, pc, , buffer) . findPC prog . Just . bool l1 l2 . (== 0)
    (Out e) -> either throwError (pure . nextState) $ evalExpr e reg
        where nextState = (reg, mem, pc, pc + 1, ) . (++ "\n") . show

evalExpr :: Expr -> Reg -> Throws Integer
evalExpr (Value v) reg = evalValue v reg
evalExpr (Neg   v) reg = negate <$> evalValue v reg
evalExpr (Not v) reg =
    either throwError (pure . bool 0 1 . (== 0)) $ evalValue v reg
evalExpr (v1 :+: v2) reg = (+) <$> evalValue v1 reg <*> evalValue v2 reg
evalExpr (v1 :-: v2) reg = (-) <$> evalValue v1 reg <*> evalValue v2 reg
evalExpr (v1 :*: v2) reg = (*) <$> evalValue v1 reg <*> evalValue v2 reg
evalExpr (v1 :|: v2) reg = (.|.) <$> evalValue v1 reg <*> evalValue v2 reg
evalExpr (v1 :&: v2) reg = (.&.) <$> evalValue v1 reg <*> evalValue v2 reg
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
evalValue (Const n) _   = pure n
evalValue (Var   x) reg = case Map.lookup x reg of
    Just v  -> pure v
    Nothing -> throwError $ UndefVar x
