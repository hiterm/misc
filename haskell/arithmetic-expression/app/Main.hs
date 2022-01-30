{-# LANGUAGE OverloadedStrings #-}

module Main where

import AST
import Data.Text
import Data.Text.IO as IO
import ExpressionParser
import Text.Megaparsec

main :: IO ()
main = do
  input <- IO.getLine
  let exp = runParser (expression <* eof) "" input
  let result = eval <$> exp
  case result of
    Right n -> print n
    Left e -> Prelude.putStrLn $ errorBundlePretty e
