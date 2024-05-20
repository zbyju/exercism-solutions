module Robot
  ( Bearing (East, North, South, West),
    bearing,
    coordinates,
    mkRobot,
    move,
  )
where

data Bearing
  = North
  | East
  | South
  | West
  deriving (Eq, Show)

data Robot = Robot {x :: Integer, y :: Integer, b :: Bearing}

bearing :: Robot -> Bearing
bearing (Robot _ _ b) = b

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot x y _) = (x, y)

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot b (x, y) = Robot {x = x, y = y, b = b}

turnRight :: Bearing -> Bearing
turnRight West = North
turnRight North = East
turnRight East = South
turnRight South = West

turnLeft :: Bearing -> Bearing
turnLeft = turnRight . turnRight . turnRight

advance :: Robot -> Robot
advance (Robot x y West) = Robot {x = x - 1, y = y, b = West}
advance (Robot x y North) = Robot {x = x, y = y + 1, b = North}
advance (Robot x y East) = Robot {x = x + 1, y = y, b = East}
advance (Robot x y South) = Robot {x = x, y = y - 1, b = South}

moveOne :: Char -> Robot -> Robot
moveOne 'R' (Robot x y b) = Robot {x = x, y = y, b = turnRight b}
moveOne 'L' (Robot x y b) = Robot {x = x, y = y, b = turnLeft b}
moveOne 'A' r = advance r
moveOne _ r = r

move :: Robot -> String -> Robot
move r [] = r
move r (x : xs) = move (moveOne x r) xs
