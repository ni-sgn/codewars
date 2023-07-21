module YourOrderPlease where

import Data.Char(digitToInt, intToDigit, isDigit)
import Data.List(sortBy)

yourOrderPlease :: String -> String
yourOrderPlease s = unwords $ sortBy ordByInnerDigit $ words s 

extract :: String -> Int
extract (s:ss) 
  | isDigit s = digitToInt s
  | otherwise = extract ss

ordByInnerDigit :: String -> String -> Ordering 
ordByInnerDigit s1 s2 
  | (extract s1) > (extract s2) = GT
  | (extract s1) < (extract s2) = LT
  | otherwise                   = EQ 

main :: IO ()
main = undefined
