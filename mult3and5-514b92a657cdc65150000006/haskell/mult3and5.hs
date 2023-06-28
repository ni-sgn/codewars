module MultiplesOf3And5 where

solution :: Integer -> Integer
solution number = 
  if number < 0 
  then 0 
  else
    sum $ multiplesOf3And5 
  where
    multiplesOf3And5 = [x | x <- [1..number-1], mod x 3 == 0 || mod x 5 == 0] 


main :: IO ()
main = print $ solution 10
