module Phone (number) where

import Data.Char (isDigit)

validate :: String -> Bool
validate ys
  | n == 10 = areaCodes
  | otherwise = False
  where
    n = length ys
    isN c = c >= '2' && c <= '9'
    areaCodes = isN (head ys) && isN (ys !! 3)

number :: String -> Maybe String
number xs
  | (f /= '+') && (f /= '(') && not (isDigit f) = Nothing
  | length ys == 11 && head ys /= '1' = Nothing
  | valid = Just $ reverse $ take 10 (reverse ys)
  | otherwise = Nothing
  where
    f = head xs
    ys = filter isDigit xs
    zs = reverse $ take 10 (reverse ys)
    valid = validate zs
