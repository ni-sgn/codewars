module HumanTime where

import Data.List (intercalate)

humanReadable :: Int -> String
humanReadable x = intercalate ":" time 
  where
    format :: Int -> String
    format x | x < 10 = '0' : (show x) | otherwise = show x 
    hs     = divMod x 3600
    ms     = divMod (snd hs) 60 
    time   = [format $ fst hs, format $ fst ms, format $ snd ms] 

main :: IO ()
main = print $ humanReadable 359999
