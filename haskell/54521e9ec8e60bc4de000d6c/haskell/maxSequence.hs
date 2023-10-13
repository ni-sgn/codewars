module MaxSequence where

-- Kadane's Algorithm
maxSequence :: [Int] -> Int
maxSequence [] = 0
maxSequence xs = kadane xs 0 (minimum xs)
  where 
    kadane :: [Int] -> Int -> Int -> Int 
    kadane [] _ maxSoFar = maxSoFar 
    kadane (x:xs) lastPosSeqSum maxSoFar 
      | sumOfCurrent < 0 = kadane xs 0 (max maxSoFar sumOfCurrent) 
      | otherwise        = kadane xs sumOfCurrent (max maxSoFar sumOfCurrent) 
      where
       sumOfCurrent = lastPosSeqSum + x 

-- original (bad)
-- maxSequence :: [Int] -> Int
-- maxSequence xs = maximum . map sum . concat $ [divvy x 1 xs | x <- [1..(length xs)]] 
  
main :: IO ()
main = print $ maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
