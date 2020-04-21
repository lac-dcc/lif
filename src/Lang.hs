module Lang where

type Const = Integer
type Label = String
type Var = String

data Value = Const Const | Var Var
instance Show Value where
    show (Const n) = show n
    show (Var   x) = x

data Expr = Value Value
          | Neg Value
          | Not Value
          | Value :+: Value
          | Value :-: Value
          | Value :*: Value
          | Value :|: Value
          | Value :&: Value
          | Value :=: Value
          | Value :!=: Value
          | Value :<: Value
          | Value :>: Value
          | Value :<=: Value
          | Value :>=: Value

instance Show Expr where
    show (Value v   ) = show v
    show (Neg   v   ) = "-" ++ show v
    show (Not   v   ) = "!" ++ show v
    show (v1 :+:  v2) = show v1 ++ " + " ++ show v2
    show (v1 :-:  v2) = show v1 ++ " - " ++ show v2
    show (v1 :*:  v2) = show v1 ++ " * " ++ show v2
    show (v1 :|:  v2) = show v1 ++ " | " ++ show v2
    show (v1 :&:  v2) = show v1 ++ " & " ++ show v2
    show (v1 :=:  v2) = show v1 ++ " = " ++ show v2
    show (v1 :!=: v2) = show v1 ++ " != " ++ show v2
    show (v1 :<:  v2) = show v1 ++ " < " ++ show v2
    show (v1 :>:  v2) = show v1 ++ " > " ++ show v2
    show (v1 :<=: v2) = show v1 ++ " <= " ++ show v2
    show (v1 :>=: v2) = show v1 ++ " >= " ++ show v2

data Inst = Mov Var Expr
          | Load Var Expr
          | Store Expr Expr
          | Phi  Var [(Label, Value)]
          | Jmp  Label
          | Br  Expr Label Label
          | Out Expr

instance Show Inst where
    show (Mov   x  e  ) = "mov(" ++ x ++ ", " ++ show e ++ ")"
    show (Load  x  e  ) = "load(" ++ x ++ ", " ++ show e ++ ")"
    show (Store e1 e2 ) = "store(" ++ show e1 ++ ", " ++ show e1 ++ ")"
    show (Phi   x  phi) = "phi(" ++ x ++ ", " ++ selectors phi ++ ")"
      where
        selectors :: [(Label, Value)] -> String
        selectors [(l, v)      ] = show v ++ ": " ++ l
        selectors ((l, v) : phi) = show v ++ ": " ++ l ++ ", " ++ selectors phi
    show (Jmp l     ) = "jmp(" ++ l ++ ")"
    show (Br e l1 l2) = "br(" ++ show e ++ ", " ++ l1 ++ ", " ++ l2 ++ ")"
    show (Out e     ) = "out(" ++ show e ++ ")"

type Prog = [(Maybe Label, Inst)]

showProg :: Prog -> String
showProg []                    = ""
showProg ((Nothing, i) : rest) = show i ++ "\n" ++ showProg rest
showProg ((Just l , i) : rest) = l ++ ":\n" ++ show i ++ "\n" ++ showProg rest
