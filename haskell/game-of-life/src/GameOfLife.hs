{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module GameOfLife (tick) where

import Data.Maybe (fromJust, isNothing, mapMaybe)

at :: [[Int]] -> Int -> Int -> Maybe Int
at grid x y
  | m == 0 || n == 0 = Nothing
  | x < 0 || y < 0 || x >= n || y >= m = Nothing
  | otherwise = Just $ grid !! y !! x
  where
    m = length grid
    n = length $ head grid

neighbors :: [[Int]] -> Int -> Int -> [Int]
neighbors grid x y = mapMaybe (uncurry $ at grid) xs
  where
    xs = [(x + 1, y - 1), (x + 1, y), (x + 1, y + 1), (x - 1, y - 1), (x - 1, y), (x - 1, y + 1), (x, y + 1), (x, y - 1)]

next :: [[Int]] -> Int -> Int -> Int
next grid x y
  | isNothing me = 0
  | otherwise =
      if isAlive
        then (if aliveNeighbors == 2 || aliveNeighbors == 3 then 1 else 0)
        else (if aliveNeighbors == 3 then 1 else 0)
  where
    me = at grid x y
    isAlive = fromJust me == 1
    ns = neighbors grid x y
    aliveNeighbors = length $ filter (== 1) ns

tick :: [[Int]] -> [[Int]]
tick grid = map (\y -> map (\x -> next grid x y) [0 .. n - 1]) [0 .. m - 1]
  where
    m = length grid
    n = length $ head grid
