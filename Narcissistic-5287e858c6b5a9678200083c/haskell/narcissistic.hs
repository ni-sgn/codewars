module Narcissistic where

import Data.Char(digitToInt)

narcissistic :: Integral n => n -> Bool
narcissistic n
  | (toInteger n) == summed = True
  | otherwise               = False
  where
    casted = show . toInteger $ n
    len    = length casted     
    summed = sum $ map ( (^len) . toInteger . digitToInt) casted  


main :: IO ()
main = print $ narcissistic 153
