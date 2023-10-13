module IPv4 where
import Data.Word (Word32)
import Data.List (intercalate)

type IPString = String

word32ToIP :: Word32 -> IPString
word32ToIP word32 = formatIP . reverse . snd $ 
  foldl (\acc x-> 
                   if ((+1) . length . fst) acc == 8
                   then ([], (binaryToDecimal $ (fst acc ++ [x])) : (snd acc))
                   else ((fst acc) ++ [x], snd acc)
                   ) ([],[]) (fillWithZeroes $ word32ToBinary word32 []) 

word32ToBinary :: Word32 -> [Int] -> [Int]
word32ToBinary w32 storage
  | w32 == 0           = storage
  | (w32 `mod` 2) == 0 = word32ToBinary (div w32 2) (0:storage) 
  | (w32 `mod` 2) == 1 = word32ToBinary (div w32 2) (1:storage)

binaryToDecimal :: [Int] -> Int
binaryToDecimal (xs) = sum $ zipWith (*) (reverse xs) (map (2^) [0,1..])

fillWithZeroes :: [Int] -> [Int]
fillWithZeroes xs = 
  if length xs < 32
  then (take (32 - (length xs)) (repeat 0)) ++ xs
  else xs

formatIP :: [Int] -> IPString
formatIP cs = intercalate "." $ map (show) cs 

main :: IO ()
main = undefined
