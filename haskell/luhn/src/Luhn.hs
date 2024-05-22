module Luhn (isValid) where

import Data.Char

parse :: String -> [Int]
parse = map digitToInt . filter isDigit

double :: Bool -> [Int] -> [Int]
double _ [] = []
double False (x : xs) = x : double True xs
double True (x : xs) = (if y > 9 then y - 9 else y) : double False xs
  where
    y = x * 2

isValid :: String -> Bool
isValid n
  | length rd <= 1 = False
  | otherwise = s `mod` 10 == 0
  where
    rd = parse n
    d = double False (reverse rd)
    s = sum d
