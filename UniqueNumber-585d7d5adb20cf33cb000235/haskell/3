module UniqueNumber where

getUnique :: [Int] -> Int
getUnique (x:xs)
  | (length (filter (==x) xs) == 1) = x 
  | otherwise = head $ filter (/=x) xs 

main :: IO ()
main = print $ getUnique [11, 11, 14, 11, 11]
