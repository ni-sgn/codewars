module DigitalRoot where

import Data.Char

digitalRoot :: Integral a => a -> a
digitalRoot n = f .  show $ toInteger n 
  where
    f :: Integral a => [Char] -> a
    f s 
      | (length s) == 1 = fromInteger . read $ s
      | (length s) >  1 = digitalRoot $ fromInteger . sum . map (toInteger . digitToInt) $ s 


main :: IO ()
main = print $ digitalRoot 62865
