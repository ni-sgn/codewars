module Compare where

comp :: [Integer] -> [Integer] -> Bool                        
comp as bs =                                                  
  if length as == length bs                                   
  then                                                        
    if  length squared == length as && sum squared == sum bs
    then True                                                 
    else False                                                
  else                                                        
    False                                                     
  where 
    squared = [ x^2 | x <- as, elem (x^2) bs] 

main :: IO ()
main = print $ comp [1,2,3] [1,3,10]
