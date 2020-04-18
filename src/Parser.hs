{-# LANGUAGE LambdaCase #-}

module Parser where

import           Control.Applicative            ( (<**>) )
import           Control.Monad.Except
import           Data.Either
import           Data.Functor
import           Data.IORef
import           Text.ParserCombinators.Parsec
import           Text.ParserCombinators.Parsec.Language
import qualified Text.ParserCombinators.Parsec.Token
                                               as Token

import           Lang
import           Error

languageDef = emptyDef
    { Token.reservedNames   = ["phi", "load", "store", "jmp", "br", "print"]
    , Token.reservedOpNames = ["="]
    }

lexer = Token.makeTokenParser languageDef

brackets = Token.brackets lexer
colon = Token.colon lexer
comma = Token.comma lexer
identifier = Token.identifier lexer
integer = Token.integer lexer
reserved = Token.reserved lexer
reservedOp = Token.reserved lexer
parens = Token.parens lexer
semi = Token.semi lexer

parseProg :: String -> IO (Throws [(Maybe Label, Inst)])
parseProg source =
    parseFromFile (parseLabeled `endBy` semi <* eof) source >>= \case
        Left  err  -> pure . throwError $ Parser err
        Right prog -> pure . Right $ prog

parseLabeled :: Parser (Maybe Label, Inst)
parseLabeled =
    (,) <$> option Nothing (Just <$> try (parseLabel <* colon)) <*> parseInst

parseLabel :: Parser Label
parseLabel = spaces *> many1 (digit <|> letter <|> char '_')

parseInst :: Parser Inst
parseInst =
    try parseAss
        <|> try parsePhi
        <|> try parseJmp
        <|> try parseBr
        <|> try parsePrint

parseAss :: Parser Inst
parseAss = Ass <$> identifier <*> (spaces *> reservedOp "=" *> parseExpr)

parsePhi :: Parser Inst
parsePhi =
    Phi
        <$> identifier
        <*> (  spaces
            *> reserved "="
            *> spaces
            *> reserved "phi"
            *> spaces
            *> many1 (parens $ (,) <$> parseValue <*> (comma *> parseLabel))
            )

-- parseLoad :: Parser Inst
-- parseLoad =
--     try
--         $   Load
--         <$> identifier
--         <*> (spaces *> reservedOp "=" *> spaces *> reserved "load" *> identifier
--             )
--         <*> brackets parseValue

parseJmp :: Parser Inst
parseJmp = Jmp <$> (reserved "jmp" *> parseLabel)

parseBr :: Parser Inst
parseBr =
    Br <$> (spaces *> reserved "br" *> parseValue) <*> parseLabel <*> parseLabel

parsePrint :: Parser Inst
parsePrint = Print <$> (spaces *> reserved "print" *> try parseValue)

parseExpr :: Parser Expr
parseExpr =
    try (parseUnaryOp <*> parseValue)
        <|> try (parseValue <**> parseBinaryOp <*> parseValue)
        <|> Value
        <$> try parseValue

parseUnaryOp :: Parser (Value -> Expr)
parseUnaryOp = spaces *> oneOf "!-" >>= \case
    '!' -> pure Not
    '-' -> pure Neg

parseBinaryOp :: Parser (Value -> Value -> Expr)
parseBinaryOp = spaces *> oneOf "+-*|&=!<" >>= \case
    '+' -> pure (:+:)
    '-' -> pure (:-:)
    '*' -> pure (:*:)
    '|' -> pure (:|:)
    '&' -> pure (:&:)
    '=' -> char '=' $> (:==:)
    '!' -> char '=' $> (:!=:)
    '<' -> pure (:<:)

parseValue :: Parser Value
parseValue = spaces *> (Const <$> integer <|> Id <$> identifier)
