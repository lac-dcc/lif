{-# LANGUAGE TupleSections #-}

module Eval where

import           Control.Monad.Except
import           Data.Bits
import           Data.Bool
import           Data.Either
import           Data.Functor
import           Data.Maybe

import           Error
import           Lang

type Prog = [(Label, Inst)]
type Store = [(Id, Integer)]

-- Store, curr block, curr inst
type State = (Store, Maybe Label, Maybe Label)

withLabel :: [(Maybe Label, Inst)] -> Prog
withLabel stms = label stms 0
  where
    label :: [(Maybe Label, Inst)] -> Int -> Prog
    label []                    _ = []
    label ((Nothing, i) : stms) n = (show n, i) : label stms (n + 1)
    label ((Just l , i) : stms) n = (l, i) : label stms n

initState :: Label -> State
initState first = ([], Just first, Just first)

nextInst :: Prog -> Label -> Maybe Label
nextInst prog l | null rest = Nothing
                | otherwise = Just . fst $ head rest
    where rest = drop 1 $ dropWhile ((/= l) . fst) prog

evalInst :: Inst -> Prog -> State -> Throws (Maybe String, State)
evalInst (Ass id expr) prog (sto, b, Just l) =
    let newState = (Nothing, ) . (, b, nextInst prog l) . (: sto) . (id, )
        success  = either throwError (pure . newState) $ evalExpr expr sto
    in  maybe success (const . throwError $ Immutable id) $ lookup id sto
evalInst (Phi id phis) prog (sto, Just b, Just l) =
    let labelExists = isJust . flip lookup prog
        labels = map snd phis
        checkLabels = map labelExists
        err = throwError . UndefLabel $ filter (not . labelExists) labels
        newState = (Nothing, ) . (, Just l, nextInst prog l) . (: sto) . (id, )
        success =
                either throwError (pure . newState)
                    $ flip evalValue sto
                    $ fst
                    . head
                    $ filter ((==) b . snd) phis
    in  bool err success $ and $ checkLabels labels
evalInst (Jmp l1) prog (sto, _, l0) =
    let success = const $ pure . (Nothing, ) $ (sto, l0, Just l1)
    in  maybe (throwError $ UndefLabel [l1]) success $ lookup l1 prog
evalInst (Br p l0 l1) prog (sto, _, _) =
    let labelExists = isJust . flip lookup prog
        checkLabels = map labelExists
        err = throwError . UndefLabel $ filter (not . labelExists) [l0, l1]
        newState v = (Nothing, ) (sto, next, next)
                where next = Just $ if v == 1 then l0 else l1
        success = either throwError (pure . newState) $ evalValue p sto
    in  bool err success $ all labelExists [l0, l1]
evalInst (Print v0) prog (sto, b, Just l) =
    let success = (, (sto, b, nextInst prog l)) . Just . (++ "\n") . show
    in  either throwError (pure . success) $ evalValue v0 sto

evalExpr :: Expr -> Store -> Throws Integer
evalExpr (Value v) sto = evalValue v sto
evalExpr (Neg   v) sto = negate <$> evalValue v sto
evalExpr (Not   v) sto = case evalValue v sto of
    err@Left{} -> err
    Right r    -> pure $ if r == 0 then 1 else 0
evalExpr (v0 :+:  v1) sto = evalAExpr (+) v0 v1 sto
evalExpr (v0 :-:  v1) sto = evalAExpr (-) v0 v1 sto
evalExpr (v0 :*:  v1) sto = evalAExpr (*) v0 v1 sto
evalExpr (v0 :|:  v1) sto = evalAExpr (.|.) v0 v1 sto
evalExpr (v0 :&:  v1) sto = evalAExpr (.&.) v0 v1 sto
evalExpr (v0 :==: v1) sto = evalBExpr (==) v0 v1 sto
evalExpr (v0 :!=: v1) sto = evalBExpr (/=) v0 v1 sto
evalExpr (v0 :<:  v1) sto = evalBExpr (<) v0 v1 sto
evalExpr (v0 :>:  v1) sto = evalBExpr (>) v0 v1 sto
evalExpr (v0 :<=: v1) sto = evalBExpr (<=) v0 v1 sto
evalExpr (v0 :>=: v1) sto = evalBExpr (>=) v0 v1 sto

evalAExpr
    :: (Integer -> Integer -> Integer)
    -> Value
    -> Value
    -> Store
    -> Throws Integer
evalAExpr op v0 v1 sto = case evalValue v0 sto of
    err@Left{} -> err
    Right r    -> op r <$> evalValue v1 sto

evalBExpr
    :: (Integer -> Integer -> Bool) -> Value -> Value -> Store -> Throws Integer
evalBExpr op v0 v1 sto = case evalValue v0 sto of
    err@Left{} -> err
    Right v2   -> toInteger . fromEnum . op v2 <$> evalValue v1 sto

evalValue :: Value -> Store -> Throws Integer
evalValue (Const c ) _   = pure c
evalValue (Id    id) sto = case lookup id sto of
    Just v  -> pure v
    Nothing -> throwError $ UndefId id
