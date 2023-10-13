module Change where

f :: Int -> [Int] -> Int
f _ []  = 0 
f weight (w:ws) 
  | w == weight = 1 
  | w < weight  = (f (weight-w) (w:ws) ) + (f weight (ws) ) 
  | otherwise   = 0 


main :: IO ()
main =  print $ f 4 [1,2]  



