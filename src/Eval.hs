{-# LANGUAGE TupleSections #-}

module Eval where

import           Control.Monad.Except
import           Data.Bits
import           Data.Bool
import           Data.Either
import           Data.List
import           Data.Functor
import           Data.Maybe

import           Error
import           Lang

type Reg = [(Var, Integer)]
type PC = Int

-- Reg, previous PC, current PC and output buffer
type State = (Reg, PC, PC, String)

-- Walk backwards searching for the block label
findLabel :: Prog -> PC -> Label
findLabel prog pc =
    fromJust . fst . head . dropWhile (isNothing . fst) . reverse $ take
        (pc + 1)
        prog

initState :: State
initState = ([], -1, 0, "")

labels :: Prog -> [Maybe Label]
labels = map fst

findPC :: Prog -> Maybe Label -> PC
findPC prog = fromJust . flip elemIndex (labels prog)
--
eval :: Prog -> State -> Throws State
eval prog s@(reg, pc', pc, buffer) = case snd (prog !! pc) of
    (Mov x e) -> either throwError (pure . push) $ evalExpr e reg
        where push = (, pc, pc + 1, buffer) . (: reg) . (x, )
    (Phi x phi) ->
        bool (either throwError (pure . push) $ evalValue v reg)
             (throwError $ UndefLabel undef)
            $ null undef
      where
        undef = catMaybes $ map (Just . fst) phi `intersect` labels prog
        v     = fromJust $ lookup (findLabel prog pc') phi
        push  = (, pc, pc + 1, buffer) . (: reg) . (x, )

    (Jmp l) ->
        maybe (throwError $ UndefLabel [l]) (pure . s')
            $ find ((==) $ Just l)
            $ labels prog
        where s' = (reg, pc, , buffer) . findPC prog
    (Br e l1 l2) ->
        bool (either throwError (pure . s') $ evalExpr e reg)
             (throwError $ UndefLabel undef)
            $ null undef
      where
        undef = catMaybes $ [Just l1, Just l2] `intersect` labels prog
        s'    = (reg, pc, , buffer) . findPC prog . Just . bool l1 l2 . (== 0)
    (Out e) -> either throwError (pure . s') $ evalExpr e reg
        where s' = (reg, pc, pc + 1, ) . (++ "\n") . show

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
evalValue (Var   x) reg = case lookup x reg of
    Just v  -> pure v
    Nothing -> throwError $ UndefVar x
