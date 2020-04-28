{-# LANGUAGE TupleSections #-}

module Core.Eval
    ( State
    , initState
    , eval
    )
where

import qualified Data.Map                      as Map
import qualified Data.Sequence                 as Seq
import           Control.Monad.Except           ( throwError )
import           Data.Bits                      ( (.|.)
                                                , (.&.)
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

import           Core.Error
import           Core.Lang

type Reg = Map.Map Var Integer
type Mem = Seq.Seq Integer
type Buffer = String
type PC = Int

-- | Reg, Mem, last seen label l' (predecessor block), current PC
--   and output buffer
type State = (Reg, Mem, Label, PC, Buffer)

initState :: State
initState = (Map.empty, Seq.empty, "", 0, "")

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
    (l, Load x e) -> either throwError (pure . nextState) $ evalExpr e reg
      where
        nextState v =
            ( Map.insert x (Seq.index mem $ fromInteger v) reg
            , mem
            , fromMaybe l' l
            , pc + 1
            , buffer
            )
    (l, Store e1 e2) ->
        either
                throwError
                (\v -> either throwError (pure . nextState v) $ evalExpr e2 reg)
            $ evalExpr e1 reg
      where
        nextState v idx = (reg, , fromMaybe l' l, pc + 1, buffer)
            $ Seq.update (fromInteger idx) v mem
    (l, Phi x phi) ->
        bool (throwError $ UndefLabel undef)
             (either throwError (pure . nextState) $ evalValue v reg)
            $ null undef
      where
        undef = map fst phi
            \\ catMaybes (map (Just . fst) phi `intersect` map fst prog)
        v = fromJust $ lookup l' phi
        nextState v = (Map.insert x v reg, mem, fromMaybe l' l, pc + 1, buffer)
    (l, Jmp l1) ->
        maybe (throwError $ UndefLabel [l1]) (pure . nextState)
            $ find ((==) $ Just l1)
            $ map fst prog
        where nextState = (reg, mem, fromMaybe l' l, , buffer) . findPC prog
    (l, Br e l1 l2) ->
        bool (throwError $ UndefLabel undef)
             (either throwError (pure . nextState) $ evalExpr e reg)
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
        nextState = (reg, mem, fromMaybe l' l, pc + 1, ) . (++ "\n") . show

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

findPC :: Prog -> Maybe Label -> PC
findPC prog = fromJust . flip elemIndex (map fst prog)
