module ReverseString (reverseString) where

reverseString :: String -> String
reverseString x = tailReverse x ""

tailReverse :: String -> String -> String
tailReverse [] acc = acc
tailReverse (x : xs) acc = tailReverse xs (x : acc)
