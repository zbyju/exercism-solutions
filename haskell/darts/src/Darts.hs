module Darts (score) where

distance :: Float -> Float -> Float
distance x y = sqrt (x ** 2 + y ** 2)

score :: Float -> Float -> Int
score x y
  | d > 10 = 0
  | d > 5 = 1
  | d > 1 = 5
  | otherwise = 10
  where
    d = distance x y
