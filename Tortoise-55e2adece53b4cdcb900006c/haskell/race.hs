module Tortoise where

race :: Int -> Int -> Int -> Maybe (Int, Int, Int)
race v1 v2 g 
  | v1 >= v2 = Nothing 
  | otherwise = convert time 
      where
      time :: Float
      time = (negate $ fromIntegral g) / (fromIntegral $ v1 - v2) 
      convert :: Float -> Maybe (Int, Int, Int)
      convert tm = Just (hours tm, minutes tm, seconds tm) 
        where
        hours   :: Float -> Int
        minutes :: Float -> Int
        seconds :: Float -> Int
        hours   t   = floor t
        minutes t   = floor $ (t - fromIntegral (hours t)::Float) * 60
        seconds t   = floor $ ((t - fromIntegral (hours t)::Float) * 60 - (fromIntegral (minutes t)::Float)) * 60



main :: IO ()
-- expected (1,3,0) actual (1,2,59) 
main = print $ race 201 321 126 
