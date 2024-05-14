module SpaceAge (Planet (..), ageOn) where

data Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

ageOnInSeconds :: Planet -> Float -> Float
ageOnInSeconds Mercury seconds = seconds / 0.2408467
ageOnInSeconds Venus seconds = seconds / 0.61519726
ageOnInSeconds Earth seconds = seconds
ageOnInSeconds Mars seconds = seconds / 1.8808158
ageOnInSeconds Jupiter seconds = seconds / 11.862615
ageOnInSeconds Saturn seconds = seconds / 29.447498
ageOnInSeconds Uranus seconds = seconds / 84.016846
ageOnInSeconds Neptune seconds = seconds / 164.79132

ageOn :: Planet -> Float -> Float
ageOn planet seconds = age / 31557600 where age = ageOnInSeconds planet seconds
