module DNA (toRNA) where

charRNA :: Char -> Either Char Char
charRNA 'G' = Right 'C'
charRNA 'C' = Right 'G'
charRNA 'T' = Right 'A'
charRNA 'A' = Right 'U'
charRNA c = Left c

toRNA :: String -> Either Char String
toRNA xs = traverse charRNA xs
