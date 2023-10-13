import Data.Char

revRot :: [Char] -> Int -> [Char]
revRot str sz = snd $ 
  foldl (\(ongoing, saved) c ->
    if length (ongoing ++ [c]) == sz
    then ("", saved ++ (revOrRot (ongoing ++ [c])))
    else (ongoing ++ [c], saved)
    ) ("","") str

sumOfCubes :: [Char] -> Bool
sumOfCubes str = even $ sum [x^3 | x <- (map digitToInt str)] 

revOrRot :: [Char] -> [Char]
revOrRot str = if sumOfCubes str then reverse str else (tail str) ++ [head str]  

main :: IO ()
main = do{
  str <- getLine;
  num <- getLine;
  print $ revRot str (read num)
  }
