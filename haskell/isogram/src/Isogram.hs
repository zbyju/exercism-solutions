module Isogram (isIsogram) where

import Data.Char
import Data.Set

isIsogram :: String -> Bool
isIsogram x = length w == n
  where
    w = Prelude.filter isAlpha x
    n = length $ fromList $ Prelude.map toLower w
