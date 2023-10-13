module Persistence where

import Data.Char(digitToInt)

persistence :: Int -> Int
persistence n = fst $ persistence' (0, n) 

persistence' :: (Int, Int) -> (Int, Int) 
persistence' (i,n) = if (length casted) == 1 then (i, n) else persistence' (i+1, sumOfDigits) 
  where
    casted      = show n
    sumOfDigits = foldl1 (*) $ map digitToInt casted 

main :: IO ()
main = undefined
