module SecretHandshake (handshake) where

filterActions :: Int -> Int -> [String] -> [String]
filterActions _ _ [] = []
filterActions i n (x : xs) = if n `mod` (2 ^ i) == 0 then x : next else next
  where
    next = filterActions (i + 1) n xs

handshake :: Int -> [String]
handshake n = if n `mod` 16 == 0 then reverse filtered else filtered
  where
    actions = ["wink", "double wink", "close your eyes", "jump"]
    filtered = filterActions 0 n actions
