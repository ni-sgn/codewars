module FindEven where

findEvenIndex :: [Int] -> Int
findEvenIndex arr = f 0 arr
  where
    f :: Int -> [Int] -> Int
    f n xs | n == (length xs)    = -1 
    f n xs | sumLeft == sumRight = n 
      where
        sumLeft  = sum . take n $ xs
        sumRight = sum . tail . drop n $ xs 
    f n xs                       = f (n+1) xs

main :: IO ()
main = undefined
