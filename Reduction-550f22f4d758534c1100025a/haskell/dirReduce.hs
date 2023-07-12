module Reduction where

data Direction = North | East | West | South deriving (Eq,Show)

op :: Direction -> Direction
op North = South 
op South = North
op West  = East
op East  = West

dirReduce :: [Direction] -> [Direction]
dirReduce = dirReduce' [] 

dirReduce' :: [Direction] -> [Direction] -> [Direction]
dirReduce' acc []     = acc 
dirReduce' []  (x:xs) = dirReduce' [x] xs
dirReduce' acc (x:xs) =
  if last acc == op x 
  then
    dirReduce' (init acc) xs
  else
    dirReduce' (acc++[x])    xs


main :: IO ()
main = print $ dirReduce [North, West, East, South]
