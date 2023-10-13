module MultiplicationTable where

multiplicationTable :: Int -> [[Int]]
multiplicationTable 0 = []
multiplicationTable 1 = [[1]]
multiplicationTable n = mult 1 n [] 

mult ::  Int -> Int -> [[Int]] -> [[Int]]
mult s n res 
  | s > n = res 
  | otherwise = mult (s+1) (n) (res ++ [(map (*s) $ [1 .. n])]) 

main :: IO ()
main = undefined
