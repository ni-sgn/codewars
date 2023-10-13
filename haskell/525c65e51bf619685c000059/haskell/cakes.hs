module Baker where

import Data.Maybe (fromMaybe)

type Ingredient = String
type Amount     = Int
type Recipe     = [(Ingredient, Amount)]
type Storage    = [(Ingredient, Amount)]

cakes :: Recipe -> Storage -> Int
cakes recipe storage = minimum $ fmap (\(i,a) -> (fromMaybe 0 (lookup i storage)) `div` a) recipe 

main :: IO ()
main = print $ cakes [("apples",3), ("flour",300), ("sugar",150), ("milk",100), ("oil",100)] [("sugar",500), ("flour",2000), ("milk",2000)]
