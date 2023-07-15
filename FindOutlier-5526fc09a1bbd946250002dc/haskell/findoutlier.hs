module FindOutLier where

import Data.Maybe(fromJust)
import Data.List(find)

findOutlier :: [Int] -> Int
findOutlier xxs@(a:b:c:xs)
  | (length $ filter (odd) (a:b:c:[])) >= 2 = fromJust $ find even xxs 
  | otherwise                               = fromJust $ find odd xxs

main :: IO ()
main = print $ findOutlier [2, 4, 0, 100, 4, 11, 2602, 36]
