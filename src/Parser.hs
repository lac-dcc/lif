{-# LANGUAGE LambdaCase #-}

module Parser where

import           Control.Applicative            ( (<**>) )
import           Control.Monad.Except
import           Data.Either
import           Data.Functor
import           Data.IORef
import           Text.ParserCombinators.Parsec
import           Text.ParserCombinators.Parsec.Expr
import           Text.ParserCombinators.Parsec.Language
import qualified Text.ParserCombinators.Parsec.Token
                                               as Token

import           Lang
import           Error

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
whiteSpace = Token.whiteSpace lexer

readProg :: String -> IO (Throws Prog)
readProg source = parseFromFile parseProg source >>= \case
    Left  err  -> pure . throwError $ Parser err
    Right prog -> pure $ Right prog

parseProg :: Parser Prog
parseProg = do
    prog <- many
        ((,) <$> option Nothing (Just <$> identifier <* colon) <*> parseInst)
    case prog of
        []                    -> pure prog
        ((Just l , i) : _   ) -> pure prog
        ((Nothing, i) : rest) -> pure ((Just "@begin", i) : rest)

parseInst :: Parser Inst
parseInst =
    parseAlloc
        <|> parseMov
        <|> parseLoad
        <|> parseStore
        <|> parsePhi
        <|> parseJmp
        <|> parseBr
        <|> parseOut

inst :: String -> Parser Inst -> Parser Inst
inst name parser = reserved name *> parens parser

parseAlloc :: Parser Inst
parseAlloc = inst "alloc" $ Alloc <$> (identifier <* comma) <*> parseExpr

parseMov :: Parser Inst
parseMov = inst "mov" $ Mov <$> (identifier <* comma) <*> parseExpr

parseLoad :: Parser Inst
parseLoad = inst "load" $ Load <$> (identifier <* comma) <*> parseExpr

parseStore :: Parser Inst
parseStore = inst "store" $ Store <$> (parseExpr <* comma) <*> parseExpr

parsePhi :: Parser Inst
parsePhi =
    inst "phi"
        $        Phi
        <$>      (identifier <* comma)
        <*>      (flip (,) <$> (parseValue <* colon) <*> identifier)
        `sepBy1` symbol ","

parseJmp :: Parser Inst
parseJmp = inst "jmp" $ Jmp <$> identifier

parseBr :: Parser Inst
parseBr =
    inst "br"
        $   Br
        <$> (parseExpr <* comma)
        <*> (identifier <* comma)
        <*> identifier

parseOut :: Parser Inst
parseOut = inst "out" $ Out <$> parseExpr

parseExpr :: Parser Expr
parseExpr =
    (symbol "-" $> Neg <|> symbol "!" $> Not)
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
        , parseOp "|"  (:|:)
        , parseOp "&"  (:&:)
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
