module PIN where


getPINs :: String -> [String]
getPINs observed = comb $ map adjacent observed 

comb :: [String] -> [String]
comb [] = [""]
comb ([]:xs) = []
comb (x:xs) = (map ((head x):) (comb xs)) ++ comb ((tail x):xs) 

adjacent :: Char -> String
adjacent c =   
  case c of
  '1'       -> "124"
  '2'       -> "1235"
  '3'       -> "236"
  '4'       -> "1457"
  '5'       -> "24568"
  '6'       -> "3569"
  '7'       -> "478"
  '8'       -> "57890"
  '9'       -> "689"
  '0'       -> "08"
  otherwise -> "" 
  

main :: IO ()
main = undefined
