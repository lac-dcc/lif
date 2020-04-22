module Lang where

type Const = Integer
type Label = String
type Var = String

data Value = Const Const | Var Var deriving (Eq, Ord)
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
          deriving (Eq, Ord)

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

data Inst = Alloc Var Expr
          | Mov Var Expr
          | Load Var Expr
          | Store Expr Expr
          | Phi  Var [(Label, Value)]
          | Jmp  Label
          | Br  Expr Label Label
          | Out Expr
          deriving (Eq, Ord)

instance Show Inst where
    show (Alloc x  e  ) = "alloc(" ++ x ++ ", " ++ show e ++ ")"
    show (Mov   x  e  ) = "mov(" ++ x ++ ", " ++ show e ++ ")"
    show (Load  x  e  ) = "load(" ++ x ++ ", " ++ show e ++ ")"
    show (Store e1 e2 ) = "store(" ++ show e1 ++ ", " ++ show e2 ++ ")"
    show (Phi   x  phi) = "phi(" ++ x ++ ", " ++ selectors phi ++ ")"
      where
        selectors :: [(Label, Value)] -> String
        selectors [(l, v)      ] = show v ++ ": " ++ l
        selectors ((l, v) : phi) = show v ++ ": " ++ l ++ ", " ++ selectors phi
    show (Jmp l     ) = "jmp(" ++ l ++ ")"
    show (Br e l1 l2) = "br(" ++ show e ++ ", " ++ l1 ++ ", " ++ l2 ++ ")"
    show (Out e     ) = "out(" ++ show e ++ ")"

isControl :: Inst -> Bool
isControl i@Jmp{} = True
isControl i@Br{}  = True
isControl _       = False

labelFrom :: [Inst] -> [Label]
labelFrom []                  = []
labelFrom ((Jmp l     ) : is) = l : labelFrom is
labelFrom ((Br _ l1 l2) : is) = l1 : l2 : labelFrom is
labelFrom (_            : is) = labelFrom is

type Stm = (Maybe Label, Inst)
type Prog = [Stm]

showProg :: Prog -> String
showProg []                    = ""
showProg ((Nothing, i) : rest) = show i ++ "\n" ++ showProg rest
showProg ((Just l , i) : rest) = l ++ ": " ++ show i ++ "\n" ++ showProg rest
