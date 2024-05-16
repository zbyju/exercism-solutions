module CollatzConjecture (collatz) where

myCollatz :: Integer -> Integer
myCollatz 1 = 0
myCollatz n
  | n `mod` 2 == 0 = 1 + myCollatz (n `div` 2)
  | otherwise = 1 + myCollatz (3 * n + 1)

collatz :: Integer -> Maybe Integer
collatz n
  | n > 0 = Just $ myCollatz n
  | otherwise = Nothing
