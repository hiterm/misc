module Main where

import Text.ParserCombinators.Parsec
import Text.Parsec

csvFile :: Parser [[String]]
csvFile = endBy line eol

line :: Parser [String]
line = sepBy cell (char ',')

cell :: Parser String
cell = many (noneOf ",\n")

eol = char '\n'

numberStr :: Parser String
numberStr = many1 digit

number :: Parser Int
number = read <$> numberStr

parseCSV :: String -> Either ParseError [[String]]
parseCSV input = parse csvFile "(unknown)" input

parseNumber :: String -> Either ParseError Int
parseNumber input = parse number "" input

main :: IO ()
main = putStrLn "Hello, Haskell!"
