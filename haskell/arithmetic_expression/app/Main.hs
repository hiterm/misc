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
eval (BinaryExpression op l r) = evalOperator op (eval l) (eval r)

evalOperator :: Operator -> Int -> Int -> Int
evalOperator Add = (+)
evalOperator Multiply = (*)

main :: IO ()
main = putStrLn "Hello, Haskell!"
