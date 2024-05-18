module Acronym (abbreviate) where

import Data.Char (isLetter, isLower, isUpper, toUpper)

f :: String -> Bool -> Bool -> String -> String
f [] _ _ acc = acc
f (x : xs) p l acc
  | p && letter = f xs np nl (acc ++ [toUpper x])
  | l && letter && (isUpper x) = f xs np nl (acc ++ [toUpper x])
  | otherwise = f xs np nl acc
  where
    np = x == ' ' || x == '-' || x == '_'
    nl = isLower x
    letter = isLetter x

abbreviate :: String -> String
abbreviate xs = f xs True False ""
