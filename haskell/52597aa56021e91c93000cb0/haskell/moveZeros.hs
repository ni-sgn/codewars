module MovingZeros where

countAndRemoveZeros :: [Int] -> (Int, [Int])
countAndRemoveZeros arr = 
  foldl ( \tpl x -> 
    if x == 0
    then ((fst tpl) + 1,  snd tpl        )
    else ( fst tpl     , (snd tpl) ++ [x])
  ) (0, []) arr

buildListOfZeros :: Int -> [Int]
buildListOfZeros n = take n (repeat 0)

moveZeros :: [Int] -> [Int]
moveZeros arr = (snd deZeroed) ++ buildListOfZeros (fst deZeroed)   
  where
  deZeroed    = countAndRemoveZeros arr 


main :: IO ()
main = print $ moveZeros [1,2,0,1,0,1,0,3,0,1]
