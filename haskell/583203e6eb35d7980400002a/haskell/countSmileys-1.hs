module Smile where


countSmileys :: [String] -> Int
countSmileys ss = sum $ map (\s -> if isValidSmile s then 1 else 0 ) ss

isValidSmile :: String -> Bool
isValidSmile cs = case cs of
  ":)" -> True
  ":D" -> True
  ":-)" -> True
  ":-D" -> True
  ":~D" -> True
  ":~)" -> True
  ";)" -> True
  ";D" -> True
  ";-)" -> True
  ";-D" -> True
  ";~)" -> True
  ";~D" -> True
  _ -> False

main :: IO ()
main = print $ countSmileys [":)", ";(", ";}", ":-D"] 
