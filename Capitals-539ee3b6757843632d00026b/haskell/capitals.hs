module Capitals where

import Data.Char(isUpper)

capitals :: String -> [Int]
capitals s = reverse $ snd $ foldl (\(i, acc) c -> if isUpper c then (i+1, i:acc) else (i+1, acc)) (0, []) s 
