module SecretHandshake (handshake) where

handshake :: Int -> [String]
handshake n
  | n >= 16 = reverse $ handshake (n - 16)
  | n >= 8 = handshake (n - 8) ++ ["jump"]
  | n >= 4 = handshake (n - 4) ++ ["close your eyes"]
  | n >= 2 = handshake (n - 2) ++ ["double blink"]
  | n >= 1 = handshake (n - 1) ++ ["wink"]
  | otherwise = []