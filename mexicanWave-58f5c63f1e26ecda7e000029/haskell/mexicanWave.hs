module MexicanWave where

import Data.Char

wave :: String -> [String]
wave s = reverse $ fst $ foldl (\acc ss ->
  if fst (makeUpper ss (snd acc)) == []
  then ((fst acc), snd acc)
  else (fst (makeUpper ss (snd acc)) : (fst acc), (snd (makeUpper ss (snd acc))) + 1)) ([] , 0) (take (length s) (repeat s)) 
  
     


makeUpper :: String -> Int -> (String, Int)
makeUpper s i =
  if i >= length s
  then ([], i)
  else if isSpace (s !! i)
  then makeUpper s  (i + 1)
  else (take i s ++ makeHeadUpper (drop i s), i)

makeHeadUpper :: String -> String
makeHeadUpper (c:s) = (toUpper c) : s

main :: IO ()
main = print $ makeUpper "hello" 3 
