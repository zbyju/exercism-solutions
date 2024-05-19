{-# LANGUAGE ImportQualifiedPost #-}

module Anagram (anagramsFor) where

import Data.Char (isAlpha, toLower)
import Data.Map (Map)
import Data.Map qualified as Map

countOccurrences :: String -> Map Char Int
countOccurrences = foldl updateMap Map.empty . filter isAlpha . map toLower
  where
    updateMap :: Map Char Int -> Char -> Map Char Int
    updateMap counts char = Map.insertWith (+) char 1 counts

isAnagram :: String -> String -> Bool
isAnagram x y
  | x == y = False
  | length x /= length y = False
  | otherwise = mx == my
  where
    mx = countOccurrences x
    my = countOccurrences y

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (\s -> isAnagram x (map toLower s)) xss
  where
    x = map toLower xs
