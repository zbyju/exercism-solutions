module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock {hours :: Int, minutes :: Int}
  deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin hrs mins = Clock {hours = nh, minutes = nm}
  where
    nm = mins `mod` 60
    nh = (hrs + (mins `div` 60)) `mod` 24

toString :: Clock -> String
toString (Clock h m) = p h ++ ":" ++ p m
  where
    p x
      | x >= 10 = show x
      | otherwise = "0" ++ show x

addDelta :: Int -> Int -> Clock -> Clock
addDelta hrs mins (Clock h m) = fromHourMin (hrs + h) (mins + m)
