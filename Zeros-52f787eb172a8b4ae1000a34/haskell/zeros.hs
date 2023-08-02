module Zeros where

zeros :: Int -> Int
zeros 0 = 0
zeros n = rec 0 maxPower 
  where
    maxPower = (fromIntegral $ round $ logBase 5 (fromIntegral $ (n)))
    rec :: Int -> Int -> Int
    rec acc p 
      | p > 0        = rec (acc + (floor $ fromIntegral (n `div` 5^p))) (p-1)
      | otherwise    = acc

main :: IO ()
main = print $ zeros 10000 
