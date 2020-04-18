module Error where

import           Control.Monad.Except
import           Lang
import           Text.ParserCombinators.Parsec

data Error = UndefId Id
           | Immutable Id
           | UndefLabel [Label]
           | Parser ParseError

instance Show Error where
    show (UndefId    id      ) = "Use of variable before definition: " ++ id
    show (Immutable id) = "Trying to redefine an existing variable: " ++ id
    show (UndefLabel l       ) = "Use of nonexistent label: " ++ show l
    show (Parser     parseErr) = "Parse error at: " ++ show parseErr

type Throws = Either Error
