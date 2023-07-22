module Tribonacci where


tribonacci :: Num a => (a,a,a) -> Int -> [a]
tribonacci (a,b,c) n = take n (tri (a,b,c)) 

tri :: Num a => (a,a,a) -> [a]
tri (a,b,c) = a:b:c:(tri (a+b+c, (b+c+a+b+c), (c+a+b+c+b+c+a+b+c))) 

main :: IO ()
main = print $ tribonacci (1,1,1) 10
