import Data.List (sort, group)

-- solution 1
-- timeouts

largestPower' :: Int -> (Int, Int)
largestPower' 1 = (0, -1)
largestPower' 2 = (1, -1)
largestPower' 3 = (1, -1)
largestPower' n = if not $ null lp then (n-1, length lp) else largestPower' (n - 1)
  where
    lp = [ x | x <- [2..(round . sqrt $ fromIntegral $ n-1 )], y <- [2..(round . logBase 2 $ fromIntegral $ n-1)], x^y == n-1]

--solution2 
largestPower'' :: Int -> (Int, Int)
largestPower'' 3 = (1,-1)
largestPower'' n = if not $ ispower $ prime_factors (n - 1) then largestPower'' (n - 1) else (n-1, length powers)
  where
    powers = [ x | x <- [2..(round . sqrt $ fromIntegral $ n-1 )], y <- [2..(round . logBase 2 $ fromIntegral $ n-1)], x^y == n-1]
    ispower :: [Int] -> Bool
    ispower [a] = False
    ispower (x:xs) = if null arr then True else False 
      where arr = filter (\y -> y /= x) (x:xs) 
    

prime_factors :: Int -> [Int]
prime_factors 1 = []
prime_factors n
  | factors == []  = [n]
  | otherwise = factors ++ prime_factors (n `div` (head factors))
  where factors = take 1 $ filter (\x -> (n `mod` x) == 0) [2 .. n-1]

--solution3
largestPower''' :: Int -> (Int, Int)
largestPower''' 3 = (1,-1)
largestPower''' n = if powers == 0 then largestPower''' (n - 1) else (n-1, powers) 
  where
    powers = if len > 0 then len - 1 else 0
      where 
        arr = filter (\x -> floor x == ceiling x) [logBase k (fromIntegral (n-1)) | k <- [2..(fromIntegral (n-1))]]
        len = length arr

--solution4(working)
largestPower :: Int -> (Int, Int)
largestPower 3 = (1, -1)
largestPower n = case last powers of
  ps@(p:_) -> (p, length ps)
  where
    powers = group $ sort $ [ x^y | x <- [2.. floor . sqrt $ fromIntegral n], y <- [2.. floor $ logBase (fromIntegral x) (fromIntegral n), x^y < n ]

