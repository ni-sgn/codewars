module Hashtag where

import Data.Char(toUpper)


generateHashtag :: String -> Maybe String                                               
generateHashtag "" = Nothing
generateHashtag s = 
  if (length $ generated s) > 140 || (generated s) == "#"
  then
    Nothing 
  else
    Just $ generated s
  where                                                                          
    generated = ('#':) . concat . map (\s -> capitalizeFirstLetter s) . words           
    capitalizeFirstLetter (c:s) = (toUpper c) : s 


main :: IO ()
main = print $ generateHashtag "hello world"
