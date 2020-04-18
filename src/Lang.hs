module Lang where

type Const = Integer
type Id = String
type Label = String

data Value = Const Const | Id Id

instance Show Value where
    show (Const c ) = show c
    show (Id    id) = id

data Expr = Value Value
          | Neg Value
          | Not Value
          | Value :+: Value
          | Value :-: Value
          | Value :*: Value
          | Value :|: Value
          | Value :&: Value
          | Value :==: Value
          | Value :!=: Value
          | Value :<: Value
          | Value :>: Value
          | Value :<=: Value
          | Value :>=: Value

instance Show Expr where
    show (Value v   ) = show v
    show (Neg   v   ) = "-" ++ show v
    show (Not   v   ) = "!" ++ show v
    show (v0 :+:  v1) = show v0 ++ " + " ++ show v1
    show (v0 :-:  v1) = show v0 ++ " - " ++ show v1
    show (v0 :*:  v1) = show v0 ++ " * " ++ show v1
    show (v0 :|:  v1) = show v0 ++ " | " ++ show v1
    show (v0 :&:  v1) = show v0 ++ " & " ++ show v1
    show (v0 :==: v1) = show v0 ++ " == " ++ show v1
    show (v0 :!=: v1) = show v0 ++ " != " ++ show v1
    show (v0 :<:  v1) = show v0 ++ " < " ++ show v1
    show (v0 :>:  v1) = show v0 ++ " > " ++ show v1
    show (v0 :<=: v1) = show v0 ++ " <= " ++ show v1
    show (v0 :>=: v1) = show v0 ++ " >= " ++ show v1

data Inst = Ass Id Expr
          | Phi  Id [(Value, Label)]
          | Load Id Id Value
          | Store Value Id Value
          | Jmp  Label
          | Br  Value Label Label
          | Ret  Value
          | Print Value

instance Show Inst where
    show (Ass x e   ) = x ++ " = " ++ show e
    show (Phi x phis) = x ++ " = " ++ "phi " ++ unwords
        [ "(" ++ show v ++ ", " ++ show l ++ ")" | (v, l) <- phis ]
    show (Load x mem idx) = x ++ " = " ++ mem ++ "[" ++ show idx ++ "]"
    show (Store x mem idx) =
        "store " ++ show x ++ " " ++ mem ++ "[" ++ show idx ++ "]"
    show (Jmp l     ) = "br " ++ show l
    show (Br p l0 l1) = "jmp " ++ show p ++ " " ++ show l0 ++ " " ++ show l1
    show (Ret   v   ) = "ret " ++ show v
    show (Print v   ) = "print " ++ show v
