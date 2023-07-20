module ReplaceWithAlphabetPosition where

import Data.Char(isAscii, isLetter, toLower)
import Data.List(intercalate)

alphabetPosition :: String -> String
alphabetPosition = intercalate " " . map  letterToAlphaPosition . map toLower . filter flt 
  where
    flt x = if isLetter x && isAscii x then True else False
    letterToAlphaPosition = show . (flip  mod 96) . fromEnum 

main :: IO ()
main = print $ alphabetPosition "The sunset sets at twelve o'clock."
