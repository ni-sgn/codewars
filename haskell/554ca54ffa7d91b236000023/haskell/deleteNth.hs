module Deletion where

import Data.List(delete)
import Data.Maybe(fromJust)

deleteNth :: [Int] -> Int -> [Int]
deleteNth lst n = deleteNth' ([],[]) lst n 

deleteNth' :: ([(Int,Int)], [Int]) -> [Int] -> Int -> [Int]
deleteNth' acc [] _     = snd acc
deleteNth' acc (x:xs) n = 
  if headLookup == Nothing 
  then
    deleteNth' ((x,1) : counter, currentResult ++ [x]) xs n
  else
    if fromJust headLookup >= n  
    then 
      deleteNth' (counter, currentResult) xs n
    else
      deleteNth' (delete counterLookup counter ++ [((fst counterLookup), (snd counterLookup) + 1)], currentResult ++ [x]) xs n
  where
    counter       :: [(Int, Int)] 
    counter       = fst acc
    currentResult :: [Int]
    currentResult = snd acc 
    headLookup    :: Maybe Int
    headLookup    = lookup x $ fst acc   
    counterLookup :: (Int, Int)
    counterLookup = (x, fromJust $ lookup x counter)

main :: IO ()
main = print $ deleteNth [1,2,3,1,2,1,2,3] 2
