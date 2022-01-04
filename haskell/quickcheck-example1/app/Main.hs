module Main where

import Test.QuickCheck

prop_RevRev xs = reverse (reverse xs) == xs
  where
    types = xs :: [Int]

prop_RevId xs = reverse xs == xs
  where types = xs::[Int]

main :: IO ()
main = do
  quickCheck prop_RevRev
  quickCheck prop_RevId
