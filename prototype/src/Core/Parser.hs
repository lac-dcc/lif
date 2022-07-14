{-# LANGUAGE LambdaCase #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Core.Parser
-- Copyright   :  (c) Luigi D. C. Soares 2020
-- License     :  GPL-3
--
-- Maintainer  :  luigidcsoares@gmail.com
-- Stability   :  experimental
-- Portability :  portable
----------------------------------------------------------------------------
module Core.Parser where

import qualified Text.ParserCombinators.Parsec.Token
                                               as Token
import           Control.Applicative            ( (<**>) )
import           Control.Monad.Except           ( throwError )
import           Data.Functor                   ( ($>) )
import           Text.ParserCombinators.Parsec  ( Parser
                                                , alphaNum
                                                , choice
                                                , eof
                                                , many
                                                , many1
                                                , oneOf
                                                , option
                                                , sepBy1
                                                , try
                                                , parseFromFile
                                                , (<|>)
                                                )
import           Text.ParserCombinators.Parsec.Language
                                                ( emptyDef )

import           Core.Lang                      ( Label
                                                , Value(..)
                                                , Expr(..)
                                                , Inst(..)
                                                , Prog
                                                , prefix
                                                )
import           Core.Error                     ( Error(..)
                                                , Throws
                                                )


readProg :: String -> IO (Throws Prog)
readProg source = parseFromFile parseProg source >>= \case
    Left  err  -> pure . throwError $ Parser err
    Right prog -> pure $ Right prog

languageDef = emptyDef
    { Token.reservedNames = [ "alloc"
                            , "mov"
                            , "load"
                            , "store"
                            , "phi"
                            , "jmp"
                            , "br"
                            , "out"
                            ]
    , Token.identLetter   = alphaNum <|> oneOf "_.'"
    }

lexer = Token.makeTokenParser languageDef

colon = Token.colon lexer
comma = Token.comma lexer
identifier = Token.identifier lexer
integer = Token.integer lexer
parens = Token.parens lexer
reserved = Token.reserved lexer
symbol = Token.symbol lexer

parseProg :: Parser Prog
parseProg = do
    prog <- (++) . concat <$> many (try parseBlock) <*> (parseExit <* eof)
    case prog of
        []                    -> pure prog
        ((Just l , i) : _   ) -> pure prog
        ((Nothing, i) : rest) -> pure ((Just $ prefix ++ "begin", i) : rest)

parseLabeled :: Parser (Inst -> (Maybe Label, Inst))
parseLabeled = (,) <$> option Nothing (Just <$> identifier <* colon)

parseExit :: Parser Prog
parseExit = many $ parseLabeled <*> parseInst

parseBlock :: Parser Prog
parseBlock =
    (++)
        <$> many (try $ parseLabeled <*> parseInst)
        <*> ((: []) <$> (parseLabeled <*> parseTerminator))

parseTerminator :: Parser Inst
parseTerminator = parseJmp <|> parseBr

parseInst :: Parser Inst
parseInst =
    parseAlloc
        <|> parseMov
        <|> parseLoad
        <|> parseStore
        <|> parsePhi
        <|> parseOut

inst :: String -> Parser Inst -> Parser Inst
inst name parser = reserved name *> parens parser

parseAlloc :: Parser Inst
parseAlloc = inst "alloc" $ Alloc <$> (identifier <* comma) <*> parseExpr

parseMov :: Parser Inst
parseMov = inst "mov" $ Mov <$> (identifier <* comma) <*> parseExpr

parseLoad :: Parser Inst
parseLoad =
    inst "load"
        $   Load
        <$> (identifier <* comma)
        <*> (identifier <* comma)
        <*> parseValue

parseStore :: Parser Inst
parseStore =
    inst "store"
        $   Store
        <$> (parseValue <* comma)
        <*> (identifier <* comma)
        <*> parseValue

parsePhi :: Parser Inst
parsePhi =
    inst "phi"
        $   Phi
        <$> (identifier <* comma)
        <*> ((:) <$> (parseSelector <* comma) <*> parseSelector `sepBy1` symbol
                ","
            )
    where parseSelector = flip (,) <$> (parseValue <* colon) <*> identifier

parseJmp :: Parser Inst
parseJmp = inst "jmp" $ Jmp <$> identifier

parseBr :: Parser Inst
parseBr =
    inst "br"
        $   Br
        <$> (parseValue <* comma)
        <*> (identifier <* comma)
        <*> identifier

parseOut :: Parser Inst
parseOut = inst "out" $ Out <$> parseExpr

parseExpr :: Parser Expr
parseExpr =
    (symbol "-" $> Neg <|> symbol "!" $> Not <|> symbol "~" $> BitNot)
        <*>  parseValue
        <|>  parseValue
        <**> (flip <$> parseBinOp <*> parseValue <|> pure Value)

parseBinOp :: Parser (Value -> Value -> Expr)
parseBinOp = choice binOps
  where
    binOps =
        [ parseOp "+"  (:+:)
        , parseOp "-"  (:-:)
        , parseOp "*"  (:*:)
        , parseOp "&"  (:&:)
        , parseOp "|"  (:|:)
        , parseOp ">>" (:>>:)
        , parseOp "<<" (:<<:)
        , parseOp "="  (:=:)
        , parseOp "!=" (:!=:)
        , parseOp "<"  (:<:)
        , parseOp ">"  (:>:)
        , parseOp "<=" (:<=:)
        , parseOp ">=" (:>=:)
        ]
    parseOp name op = symbol name $> op

parseValue :: Parser Value
parseValue = Const <$> integer <|> Var <$> identifier
