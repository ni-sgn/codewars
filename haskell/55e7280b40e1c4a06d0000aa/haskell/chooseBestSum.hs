module SumOfK where

import Data.List.Split
import Data.List


powerSet :: [Int] -> [[Int]]
powerSet     [] = [[]]
powerSet (x:xs) = [x:ps | ps <- powerSet xs] ++ powerSet xs

combs :: Int -> [Int] -> [[Int]]
combs 0 _        = [[]]
combs _ []       = [] 
combs n (x : xs) = map (x :) (combs (n-1) xs) ++ combs n xs          

chooseBestSum :: Int -> Int -> [Int] -> Maybe Int
chooseBestSum t k ls = result 
  where
  divved   = combs k ls 
  sums     = map sum divved
  filtered = filter (<=t) sums 
  sorted   = sort filtered
  result   = case sorted of
               []        -> Nothing
	       otherwise -> Just $ last sorted


main :: IO ()
main = print $ chooseBestSum 174 3 [50, 55, 57, 58, 60] 
