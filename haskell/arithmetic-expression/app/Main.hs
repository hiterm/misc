{-# LANGUAGE OverloadedStrings #-}

module Main where

import AST
import Data.Text
import Data.Void
import Text.Megaparsec
import Text.Megaparsec.Char
import qualified Text.Megaparsec.Char.Lexer as L

type Parser = Parsec Void Text

number :: Parser Expression
number = IntegerLiteral <$> L.decimal

expression :: Parser Expression
expression = Prelude.foldl f <$> l <*> r
  where
    l = number
    r = many ((,) <$> char '+' <*> number)
    f e1 (op, e2) = BinaryExpression Add e1 e2

main :: IO ()
main = print $ eval $ BinaryExpression Add (IntegerLiteral 1) (IntegerLiteral 2)
