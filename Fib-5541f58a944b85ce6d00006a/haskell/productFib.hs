module Fib where

productFib :: Integer -> (Integer, Integer, Bool)
productFib n = fib 0 1 n
  where
    fib a1 a2 n
      | a1 * a2 < n = fib a2 (a1+a2) n
      | a1 * a2 > n = (a1, a2, False)
      | otherwise   = (a1, a2, True)


main :: IO ()
main = print $ productFib 4895 
