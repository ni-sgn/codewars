module SimpleEncryption where

import Data.Char (ord)
import Data.List (intercalate)

toAscii :: Char -> String
toAscii c = show $ ord c 

encryptThis :: String -> String
encryptThis ""  = ""
encryptThis str = result
  where
  worded                      = words str
  changeFirstLetter  :: String -> String
  changeFirstLetter (x:xs)    = (toAscii x) ++ xs  
  changeSecondLetter :: String -> String
  changeSecondLetter []       = []
  changeSecondLetter [a]      = [a]
  changeSecondLetter (a:b:[]) = (a : b : [])
  changeSecondLetter (a:b:xs) = (a : [(last xs)]) ++ (init xs) ++ [b]
  result                      = intercalate " " $ map (changeFirstLetter . changeSecondLetter) worded


main :: IO ()
main = print $ encryptThis "hello world" 
