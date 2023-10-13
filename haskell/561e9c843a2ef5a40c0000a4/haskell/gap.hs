module GapInPrimes where

isPrime :: Integer -> Bool
isPrime n 
  | n < 2     = False
  | n == 2    = True
  | otherwise = if length factors == 0 then True else False 
  where
  factors = [x | x <- 2:([3,5..round $ sqrt $ fromInteger n]), mod n x == 0]

gap :: Integer -> Integer -> Integer -> Maybe (Integer, Integer) 
gap g m n = result g primes 
  where
  primes            = [x | x <- [m .. n], isPrime x]
  result :: Integer -> [Integer] -> Maybe (Integer, Integer)
  result _   [a]    = Nothing
  result gg (x:xs) = if (head xs) - x == gg then Just (x, head xs) else result gg xs 

main :: IO ()
main = print $ gap 2 3 50 
