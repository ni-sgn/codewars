module CamelCase where

import Data.Char(toUpper)
import Data.Maybe(fromJust)

toCamelCase :: String -> String
toCamelCase str = getFirstWord ++ (concat $ snd $ foldr transfer ("", [[]]) str)
  where
    firstLetterToUpper :: String -> Maybe String
    firstLetterToUpper []     = Nothing
    firstLetterToUpper (x:xs) = Just ((toUpper x) : xs) 
    transfer           :: Char -> (String, [String]) -> (String, [String]) 
    transfer c (cs, ws)       = case c of
                                  '-' -> ([], (fromJust $ firstLetterToUpper cs):ws)
                                  '_' -> ([], (fromJust $ firstLetterToUpper cs):ws)
                                  _   -> (c:cs, ws)
    getFirstWord              = takeWhile (\x -> not (x == '_' || x == '-')) str

main :: IO ()
main = print $ toCamelCase "snake_into_a_camel"
