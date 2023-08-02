module WeightSort where

import Data.List (sortBy, intercalate)
import Data.Char (digitToInt)

orderWeight :: [Char] -> [Char]
orderWeight str 
    | null str  = []
    | otherwise = intercalate " " $ sortBy f (words str) 
    where
     f a1 a2  = 
        if (digitSum a1) > digitSum a2
        then GT
        else if (digitSum a1) == (digitSum a2) 
            then if a1 > a2
                 then GT
                 else if a1 < a2
                 then LT
                 else EQ
        else EQ
     digitSum = sum . fmap digitToInt  

main :: IO ()
main = print $ orderWeight "9999 10003 2000 44444444 9999"
