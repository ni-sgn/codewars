module Perimeter where

perimeter :: Integer -> Integer
perimeter n = (4*) $ fib n 0 1 0

fib :: Integer -> Integer -> Integer -> Integer -> Integer
fib 0 t1 t2 s = (s+t1+t2)
fib n t1 t2 s = fib (n-1) t2 (t1 + t2) (s + t1)

main :: IO ()
main = print $ fib 6 0 1 0 
