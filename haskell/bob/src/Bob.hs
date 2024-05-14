module Bob (responseFor) where

import Data.Char (isLetter, isSpace, isUpper)
import Debug.Trace (traceShow)

isAllUpperCase :: String -> Bool
isAllUpperCase [] = True
isAllUpperCase (x : xs)
  | isLetter x = isUpper x && isAllUpperCase xs
  | otherwise = isAllUpperCase xs

hasLetter :: String -> Bool
hasLetter = any isLetter

isAllEmpty :: String -> Bool
isAllEmpty = all isSpace

trim :: String -> String
trim = f . f
  where
    f = reverse . dropWhile isSpace

responseFor :: String -> String
responseFor s
  | isSilent = "Fine. Be that way!"
  | isQuestion && isCapital && isSentence = "Calm down, I know what I'm doing!"
  | isQuestion = "Sure."
  | isCapital && isSentence = "Whoa, chill out!"
  | otherwise = "Whatever."
  where
    xs = trim s
    isSilent = isAllEmpty xs
    isQuestion = last xs == '?'
    isSentence = hasLetter xs
    isCapital = isAllUpperCase xs
