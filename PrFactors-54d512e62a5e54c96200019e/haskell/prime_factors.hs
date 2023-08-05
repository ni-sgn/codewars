module PrFactors where

factorize :: Integer -> Integer -> Integer -> (Integer, Integer)
factorize n x c                    
  | (mod n x) == 0 = factorize (div n x) x (c+1) 
  | otherwise      = (n, c) 
 
prime_factors :: Integer -> String 
prime_factors n = case str of                                  
  "" -> bracket (show n)
  _  -> str 
  where
    bracket s = "(" ++ s ++ ")" 
    str = case fst folded of
      1 -> concat $ reverse $ snd $ folded
      b -> concat $ reverse $ (bracket $ show b) : (snd $ folded) 
    folded = foldl
            (\acc x -> 
            let
                res = factorize (fst acc) x 0 
            in
                case snd res of
                0 -> (fst res,  (snd acc)) 
                _ -> (fst res,  (format (x, snd res) : snd acc))
    
            ) (n, []) (2:[3,5..round$sqrt$fromInteger n]) 
    format (n,c) =                                             
        if c > 1
        then
          bracket $ (show n) ++ "**" ++ (show c)
        else                                                   
          bracket $ (show n)       


main :: IO ()
main = print $ prime_factors 7775460 
