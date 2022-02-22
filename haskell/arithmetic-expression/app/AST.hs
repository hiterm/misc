module AST where

data Expression
  = IntegerLiteral Int
  | BinaryExpression Operator Expression Expression
  deriving (Show)

data Operator
  = Add
  | Subtract
  | Multiply
  | Division
  deriving (Show)

eval :: Expression -> Int
eval (IntegerLiteral n) = n
eval (BinaryExpression op l r) = evalOperator op (eval l) (eval r)

evalOperator :: Operator -> Int -> Int -> Int
evalOperator Add = (+)
evalOperator Subtract = (-)
evalOperator Multiply = (*)
evalOperator Division = div
