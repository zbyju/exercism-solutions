module Prime (nth) where

isPrime :: Int -> Bool
isPrime n
  | n <= 1 = False
  | otherwise = all (\x -> n `mod` x /= 0) [2 .. (floor . sqrt $ fromIntegral n)]

nth :: Int -> Maybe Integer
nth n
  | n < 1 = Nothing
  | otherwise = Just $ fromIntegral (head (drop (n - 1) (filter isPrime [2 ..])))
