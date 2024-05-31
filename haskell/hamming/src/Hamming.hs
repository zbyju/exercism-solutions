module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
  | length xs /= length ys = Nothing
  | otherwise = Just $ f xs ys
  where
    f [] [] = 0
    f (x : xs) (y : ys)
      | x == y = f xs ys
      | otherwise = 1 + f xs ys
