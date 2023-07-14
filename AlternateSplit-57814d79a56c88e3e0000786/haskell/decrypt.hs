module AlternateSplit where

import Data.List.Split

type Indexed a = (Int, a) 

indexList :: [a] -> [Indexed a]
indexList = zip [ 0 .. ] 

elemsAtOdd :: [Indexed a] -> [a]
elemsAtOdd ilst = [ snd x | x <- ilst, (fst x) `mod` 2 == 1] 

elemsAtEven :: [Indexed a] -> [a]
elemsAtEven ilst = [ snd x | x <- ilst, (fst x) `mod` 2 == 0] 


encrypt' :: Indexed [Char] -> Int -> Indexed [Char] 
encrypt' (a, b) n = if a > n then (a,b) else encrypt' (a+1, transformed) n
  where
  transformed = elemsAtOdd (indexList b) ++ elemsAtEven (indexList b) 

encrypt :: String -> Int -> String
encrypt lst n = snd $ encrypt' (1, lst) n 

mix :: [a] -> [a] -> [a] -> [a]
mix []     []   res   = res
mix [o]    []   res   = res ++ [o]
mix []     [e]  res   = res ++ [e]  
mix (o:os) (e:es) res = mix os es ((res ++ [e]) ++ [o]) 

decrypt' :: Indexed [Char] -> Int -> Indexed [Char]
decrypt' (a, b) n = if a > n then (a,b) else decrypt' (a+1, transformed b ) n
  where
  spl = splitAt (div (length b) 2) b 
  transformed tst = mix (fst spl) (snd spl) []

decrypt :: String -> Int -> String
decrypt lst n = snd $ decrypt' (0, lst) n  

main :: IO ()
main = undefined
