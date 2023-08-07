module Sumdivsq where

import Data.List

divisors :: Int -> [Int]
divisors n = nub $ foldl (\acc x -> if (n `mod` x) == 0 then x:(n`div`x):acc else acc) [] [1.. floor$sqrt$fromIntegral n]

predicate :: [Int] -> Bool
predicate xs = 
  let summed = sum $ map (^2) xs
  in  (== summed) $ (floor$sqrt$fromIntegral summed)^2 

listSquared :: Int -> Int -> [(Int, Int)]
listSquared m n = ((1,1):) $  map format $ filter predicate (map divisors [m..n])
  where
    format xs = (maximum xs, sum $ map (^2) xs) 



main :: IO ()
main = undefined
