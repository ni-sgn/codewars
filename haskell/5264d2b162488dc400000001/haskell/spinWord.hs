module Spinning where

spinWords :: String -> String
spinWords str = unwords . map f . words $ str 
  where
    f w 
      | (length w) >= 5 = reverse w
      | otherwise       = w

main :: IO ()
main = print $ spinWords "Hey fellow warriors"
