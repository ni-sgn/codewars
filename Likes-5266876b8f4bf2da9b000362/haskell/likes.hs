module Likes where

import Data.List

likes :: [String] -> String
likes []            = "no one likes this"
likes [p1]          = intercalate " " [p1, "likes this"] 
likes (p1:p2:[])    = intercalate " " [p1, "and", p2, "like this"] 
likes (p1:p2:p3:[]) = intercalate " " [p1 ++ ",", p2, "and", p3, "like this"]
likes (p1:p2:ps)    = intercalate " " [p1 ++ ",", p2, "and", show $ length ps, "others like this"] 



main :: IO ()
main = print $ likes ["Alex", "Jacob", "Mark", "Max"] 
