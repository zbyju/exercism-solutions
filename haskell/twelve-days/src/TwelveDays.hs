module TwelveDays (recite) where

import Data.List (intercalate)

-- Gifts corresponding to each day
gifts :: [String]
gifts =
  [ "a Partridge in a Pear Tree.",
    "two Turtle Doves, and ",
    "three French Hens, ",
    "four Calling Birds, ",
    "five Gold Rings, ",
    "six Geese-a-Laying, ",
    "seven Swans-a-Swimming, ",
    "eight Maids-a-Milking, ",
    "nine Ladies Dancing, ",
    "ten Lords-a-Leaping, ",
    "eleven Pipers Piping, ",
    "twelve Drummers Drumming, "
  ]

-- Days corresponding to each gift
days :: [String]
days =
  [ "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth"
  ]

-- Generate a verse for a given day
verse :: Int -> String
verse n = "On the " ++ days !! (n - 1) ++ " day of Christmas my true love gave to me: " ++ concatGifts n

-- Concatenate gifts for the given day
concatGifts :: Int -> String
concatGifts n = concat [gifts !! i | i <- [n - 1, n - 2 .. 0]]

-- Generate the song for the given range of days
recite :: Int -> Int -> [String]
recite start stop = [verse n | n <- [start .. stop]]