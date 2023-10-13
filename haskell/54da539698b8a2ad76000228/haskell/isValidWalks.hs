isValidWalk :: [Char] -> Bool
isValidWalk walk = 
  if length (take 11 walk) == 10 
  then 
    if sum mappedToInt == 0 
    then True
    else False
  else False
  where
    mappedToInt = map (\x -> if x == 'n' || x == 'w' then 1 else (-1)) (take 11 walk)

main :: IO ()
main = do{
  s <- getLine;
  print $ isValidWalk s
  }

