{-# LANGUAGE OverloadedStrings #-}

module Main where

import AST
import Data.Text
import Data.Void
import Text.Megaparsec
import Text.Megaparsec.Char
import qualified Text.Megaparsec.Char.Lexer as L

type Parser = Parsec Void Text

number :: Parser Int
number = L.decimal

expression :: Parser (Int, [(Char, Int)])
expression = (,) <$> number <*> many ((,) <$> char '+' <*> number)

main :: IO ()
main = print $ eval $ BinaryExpression Add (IntegerLiteral 1) (IntegerLiteral 2)
