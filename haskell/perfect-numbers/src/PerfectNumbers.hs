module PerfectNumbers (classify, Classification (..)) where

import Data.List
import Debug.Trace (trace)

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

factorize :: Int -> [Int]
factorize x = f 2
  where
    s = floor $ sqrt (fromIntegral x :: Double)
    f' i = x `div` i
    f i
      | i > s = [1]
      | otherwise = (if x `mod` i == 0 then [i, j] else []) ++ f (i + 1)
      where
        j = f' i

classify :: Int -> Maybe Classification
classify x
  | x <= 0 = Nothing
  | x == 1 = Just Deficient
  | s == x = Just Perfect
  | s > x = Just Abundant
  | otherwise = Just Deficient
  where
    fs = (map head . group . sort) $ factorize x
    s = sum fs
