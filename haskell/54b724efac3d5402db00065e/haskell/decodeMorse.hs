module DecodeMorse (decodeMorse) where



import Data.Char
import Data.List
import Data.List.Split

decodeMorse :: String -> String
decodeMorse code = (reverse . clean . reverse . clean) solution 
  where
    solution                 = unwords $ map (\s -> concat $ map (\c -> morseCodes ! c ) (words s)) (splitOn "s" $ snd $ foldr replaceSpaces (0, []) code)
    clean                    = dropWhile (== ' ') 
    replaceSpaces :: Char -> (Int, String) -> (Int, String)
    replaceSpaces c (n, acc) = 
      if c == ' ' then
        if n+1 == 3 then
          (0, 's':(tail $ tail $ acc))
        else 
          (n+1, c:acc)
      else
        (0, c:acc)

main :: IO ()
main = undefined
