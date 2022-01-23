module Main where

data Expression
  = IntegerLiteral Int
  | BinaryExpression Operator Expression Expression
  deriving (Show)

data Operator
  = Add
  | Multiply
  deriving (Show)

eval :: Expression -> Int
eval (IntegerLiteral n) = n
eval (BinaryExpression Add l r) = eval l + eval r
eval (BinaryExpression Multiply l r) = eval l * eval r

main :: IO ()
main = putStrLn "Hello, Haskell!"
