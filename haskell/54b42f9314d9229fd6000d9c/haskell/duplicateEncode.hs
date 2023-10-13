module Dups where

import Data.Char(toLower)
import Data.List(groupBy, sort)
import Data.Maybe(fromJust)


duplicateEncode :: String -> String
duplicateEncode xs = 
  map (\c -> if (fromJust $ lookup c original) > 1 then ')' else '(') xs
  where
    original = map (\x -> (head x, length x)) . groupBy (==) . sort . map toLower $ xs 

main :: IO ()
main = undefined
