module CalculatingWithFunctions where

plus,minus,times,dividedBy :: ((Int -> Int) -> Int) -> (Int -> Int)
plus  f     = (+) (f id) 
minus f     = flip  (-) (f id) 
times f     = (*) (f id) 
dividedBy f = flip (div) (f id)

zero,one,two,three,four,five,six,seven,eight,nine :: (Int -> Int) -> Int 
zero  f = f 0  
one   f = f 1
two   f = f 2
three f = f 3
four  f = f 4
five  f = f 5
six   f = f 6
seven f = f 7
eight f = f 8
nine  f = f 9

main :: IO ()
main = print $ two $ times $ four 
