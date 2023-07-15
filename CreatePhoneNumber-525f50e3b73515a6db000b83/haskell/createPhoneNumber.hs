module CreatePhoneNumber where

import Data.Char(intToDigit)
import Data.List(intercalate)

createPhoneNumber :: [Int] -> String
createPhoneNumber xs = intercalate " " [suffix,  intercalate "-" [prefix1, prefix2]]
  where
    sq i   = intToDigit . (flip (!!) $ i)
    suffix = '(' : (sq 0 xs) : (sq 1 xs) : (sq 2 xs) : ')' : ""
    prefix1 = (sq 3 xs) : (sq 4 xs) : (sq 5 xs) : "" 
    prefix2 = (sq 6 xs) : (sq 7 xs) : (sq 8 xs) : (sq 9 xs) : "" 


main :: IO ()
main = print $ createPhoneNumber [1,2,3,4,5,6,7,8,9,0]
