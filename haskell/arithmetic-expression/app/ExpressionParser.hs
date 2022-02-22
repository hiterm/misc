module ExpressionParser where

import AST
import Data.Text
import Data.Void
import Text.Megaparsec
import Text.Megaparsec.Char
import qualified Text.Megaparsec.Char.Lexer as L
import Data.Functor

type Parser = Parsec Void Text

number :: Parser Expression
number = IntegerLiteral <$> L.decimal

expression :: Parser Expression
expression = Prelude.foldl f <$> l <*> r
  where
    l = term
    r = many ((,) <$> ((char '+' $> Add) <|> (char '-' $> Subtract)) <*> term)
    f e1 (op, e2) = BinaryExpression op e1 e2

term :: Parser Expression
term = Prelude.foldl f <$> l <*> r
  where
    l = factor
    r = many ((,) <$> ((char '*' $> Multiply) <|> (char '/' $> Division)) <*> factor)
    f e1 (op, e2) = BinaryExpression op e1 e2

factor :: Parser Expression
factor = number <|> (char '(' *> expression <* char ')')
