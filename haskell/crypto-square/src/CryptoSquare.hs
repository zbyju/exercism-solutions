module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List (transpose)

normalize :: String -> String
normalize = map toLower . filter isAlphaNum

rectangleSize :: Int -> (Int, Int)
rectangleSize n = head [(r, c) | c <- [1 ..], let r = (n + c - 1) `div` c, r * c >= n, c >= r, c - r <= 1]

chunksOf :: Int -> String -> [String]
chunksOf _ [] = []
chunksOf n str = take n str : chunksOf n (drop n str)

populateRectangle :: (Int, Int) -> String -> [String]
populateRectangle (r, c) str = chunksOf c (str ++ replicate (r * c - length str) ' ')

encodeMessage :: [String] -> String
encodeMessage = concat . transpose

formatEncodedMessage :: (Int, Int) -> String -> String
formatEncodedMessage (r, _) str = unwords $ chunksOf r str

encode :: String -> String
encode text = formatEncodedMessage (r, c) encodedMessage
  where
    normalizedText = normalize text
    (r, c) = rectangleSize (length normalizedText)
    rectangle = populateRectangle (r, c) normalizedText
    encodedMessage = encodeMessage rectangle