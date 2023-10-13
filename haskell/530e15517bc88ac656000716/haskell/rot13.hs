module Rot13 where

import Data.Char

rot13 :: String -> String 
rot13 = 
  map (\c -> toEnum c :: Char)
  . 
  (map (\c -> 
             if isAlpha c then
               if isLower c then
                 if shift c > 122 then
                   (97 + (shift c) `mod` 123)
                 else shift c
               else
                 if shift c > 90 then
                   (65 + (shift c) `mod` 91) 
                 else
                   shift c
             else fromEnum c)
  )
  where
    shiftConst = 13 :: Int
    shift c    = (+shiftConst) . fromEnum $ c 

main :: IO ()
main = print $ rot13 "hello world"
