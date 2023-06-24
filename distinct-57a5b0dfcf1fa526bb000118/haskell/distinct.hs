-- basically custom implementation of a nub function

import Data.List


-- this implementation does not save the order
distinctBreaksOrder :: [Int] -> [Int]
distinctBreaksOrder [] = []
distinctBreaksOrder (x:xs) = if elem x xs then distinct xs else x : (distinct xs)

-- implementation that does not break the order
distinct' :: [Int] -> [Int] -> [Int]
distinct' [] _ = []
distinct' (x:xs) seen 
  | elem' x seen = distinct' xs seen  
  | otherwise = x : distinct' xs (x:seen)

distinct :: [Int] -> [Int]
distinct xs = distinct' xs []
  
-- implementation of elem
elem' :: Int -> [Int] -> Bool
elem' _ [] = False
elem' x (xs) = if x == (head xs) then True else elem' x (tail xs) 

main :: IO ()
main = print $ distinct [1,2,2,3]
