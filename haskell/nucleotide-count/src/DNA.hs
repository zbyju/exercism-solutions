module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.Map (Map, empty, insert, lookup)
import Data.Maybe (fromMaybe)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

g :: Char -> Nucleotide
g 'A' = A
g 'C' = C
g 'G' = G
g 'T' = T
g _ = A

h :: String -> Map Nucleotide Int -> Either String (Map Nucleotide Int)
h [] m = Right m
h (x : xs) m
  | x == 'A' || x == 'C' || x == 'G' || x == 'T' = h xs (insert (nuc) (count + 1) m)
  | otherwise = Left "error"
  where
    nuc = g x
    count = fromMaybe 0 $ Data.Map.lookup nuc m

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts s = h s empty
