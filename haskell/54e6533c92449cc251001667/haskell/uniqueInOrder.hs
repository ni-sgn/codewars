import Data.List(group)

uniqueInOrder :: Eq a => [a] -> [a]
uniqueInOrder = map head . group 

main :: IO ()
main = do{
  s <- getLine;
  print $ uniqueInOrder s
 }
