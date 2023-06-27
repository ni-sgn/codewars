module DataReverse where


dataReverse :: [Int] -> [Int]
dataReverse bits =  snd solver
  where 
    solver = foldl (\acc bit -> if length (bit : fst acc) == 8 then ([], (fst acc ++ [bit]) ++ snd acc) else (fst acc ++ [bit], snd acc)) ([], []) bits

main :: IO ()
main = print $ dataReverse  [0,1,0,1,0,1,1,1,1,1,1,1,0,0,0,1] 

