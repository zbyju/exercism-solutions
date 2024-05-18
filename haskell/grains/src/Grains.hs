module Grains (square, total) where

square :: Integer -> Maybe Integer
square n
  | n > 0 && n <= 64 = Just $ 2 ^ (n - 1)
  | otherwise = Nothing

totalSum :: Integer -> Integer
totalSum n = (2 ^ n) - 1

total :: Integer
total = totalSum 64