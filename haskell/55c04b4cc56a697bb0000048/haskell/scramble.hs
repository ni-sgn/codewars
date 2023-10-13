module Scramblies where

import Data.List (sort, isSubsequenceOf)

scramble :: [Char] -> [Char] -> Bool
scramble _  [] = False 
scramble [] _  = False
scramble s1 s2 
  | (sort s2) `isSubsequenceOf` (sort s1) = True 
  | otherwise                             = False 


main :: IO ()
main = print $ scramble "cedewaraaossoqqyt" "codewars" 

