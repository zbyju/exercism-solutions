module Triangle (rows) where

nextRow :: [Integer] -> [Integer]
nextRow row = zipWith (+) (0 : row) (row ++ [0])

rows :: Int -> [[Integer]]
rows n = take n (iterate nextRow [1])
