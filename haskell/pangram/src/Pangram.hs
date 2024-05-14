module Pangram (isPangram) where

import Data.Char (toLower)
import Data.Map as Map

buildMap :: String -> Map Char Bool -> Map Char Bool
buildMap [] m = m
buildMap (x : xs) m = buildMap xs (Map.insert (toLower x) True m)

allLettersPresent :: Map Char Bool -> [Char] -> Bool
allLettersPresent _ [] = True
allLettersPresent m (c : cs)
  | Map.findWithDefault False c m == False = False
  | otherwise = allLettersPresent m cs

checkAllLetters :: Map Char Bool -> Bool
checkAllLetters m = allLettersPresent m ['a' .. 'z']

isPangram :: String -> Bool
isPangram s = checkAllLetters m
  where
    m = buildMap s Map.empty