module BitCounting (countBits) where

toBinary :: Int -> [Int] -> [Int] 
toBinary n xs 
    | n > 0     = toBinary (div n 2) ( (mod n 2) : xs) 
    | otherwise = xs

countBits :: Int -> Int
countBits =  length . filter ( == 1) .  (flip toBinary $ [])


main :: IO ()
main = print $ countBits 1234

