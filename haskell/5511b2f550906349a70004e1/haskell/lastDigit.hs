module LastDigit where

import Data.Char  (digitToInt)
import Data.Maybe (fromJust)

type Storage a = [a]
type Power     = Integer 

lastDigit :: Integer -> Power -> Integer
lastDigit a b = 
  let 
    ldwl = lastDigitWithLoop a b 1 [] 
  in
    if         (b == 0) 
    then       1
    else if    (ldwl == Nothing)
    then       (toInteger . digitToInt . last . show) (a ^ b)
    else       fromJust ldwl

lastDigitWithLoop :: Integer -> Power -> Integer -> Storage Char -> Maybe Integer  
lastDigitWithLoop n mp p xs
  | p == mp   = Nothing 
  | otherwise =
      let 
        powered   = n ^ p
        lastDigit = (last . show) powered
      in
        if    (lastDigit `elem` xs)
        then  Just $ fromIntegral . digitToInt $ (fixTheOrder xs) !! (mod (fromIntegral mp) (length xs)) 
        else  lastDigitWithLoop n mp (p+1) (xs ++ [lastDigit]) 
        where
          fixTheOrder ([])   = []
          fixTheOrder (x:[]) = [x] 
          fixTheOrder (xs) = (last xs) : (init xs) 
          
main :: IO ()
main = print $ lastDigit 4 2 
