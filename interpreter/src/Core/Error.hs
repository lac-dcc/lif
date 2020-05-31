module Core.Error
    ( Error(..)
    , Throws
    )
where

import           Text.ParserCombinators.Parsec  ( ParseError )

import           Core.Lang                      ( Label
                                                , Var
                                                )

data Error = UndefVar Var
           | UndefLabel [Label]
           | Parser ParseError

instance Show Error where
    show (UndefVar   x       ) = "Use of variable before definition: " ++ x
    show (UndefLabel l       ) = "Use of nonexistent label: " ++ show l
    show (Parser     parseErr) = "Parse error at: " ++ show parseErr

type Throws = Either Error
