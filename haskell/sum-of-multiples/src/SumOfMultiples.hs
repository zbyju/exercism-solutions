module SumOfMultiples (sumOfMultiples) where

import Data.Set (Set, empty, insert, toList, union)

setOfFactor :: Integer -> Integer -> Integer -> Set Integer -> Set Integer
setOfFactor i x m s
  | i == 0 = s
  | x >= m = s
  | otherwise = setOfFactor i (x + i) m (insert x s)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum (toList set)
  where
    sets = map (\factor -> setOfFactor factor factor limit empty) factors
    set = foldr union empty sets
