module Minesweeper (annotate) where

import Data.Char (chr, ord)
import Data.Maybe (mapMaybe)

at :: [a] -> Int -> Maybe a
at list i
  | i < 0 = Nothing
  | i >= length list = Nothing
  | otherwise = Just (list !! i)

charAt :: [[a]] -> Int -> Int -> Maybe a
charAt board x y = case row of
  Nothing -> Nothing
  Just r -> at r x
  where
    row = at board y

findNeighbors :: Int -> Int -> [String] -> [Char]
findNeighbors x y board = mapMaybe (uncurry (charAt board)) neighbors
  where
    -- All 8 neighboring positions
    neighbors =
      [ (x - 1, y - 1),
        (x - 1, y),
        (x - 1, y + 1),
        (x, y - 1),
        (x, y + 1),
        (x + 1, y - 1),
        (x + 1, y),
        (x + 1, y + 1)
      ]

transform :: Int -> Int -> [String] -> Char
transform x y b
  | c == ' ' = if cnt == 0 then ' ' else chr (cnt + ord '0')
  | otherwise = c
  where
    c = (b !! y) !! x
    ns = findNeighbors x y b
    cnt = length $ filter (== '*') ns

annotate :: [String] -> [String]
annotate board
  | m == 0 = board
  | n == 0 = board
  | otherwise = map (\y -> map (\x -> transform x y board) [0 .. n - 1]) [0 .. m - 1]
  where
    m = length board
    n = length $ head board
