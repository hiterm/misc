module Main where

import AST

main :: IO ()
main = print $ eval $ BinaryExpression Add (IntegerLiteral 1) (IntegerLiteral 2)
