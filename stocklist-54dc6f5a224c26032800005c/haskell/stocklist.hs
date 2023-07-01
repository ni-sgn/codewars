module Bookseller where

data Stock = Stock String Int deriving (Show, Eq)

stocklist :: [Stock] -> [Char] -> [(Char, Int)]
stocklist st cs = map (\x -> (x, getBookTotalQuantity x st)) cs 

getBookTotalQuantity :: Char -> [Stock] -> Int
getBookTotalQuantity c st = sum $ map (\(Stock a b) -> b) $ filter (\(Stock a b) -> c == (head a)) st 


main :: IO ()
main = print $ stocklist [Stock "ABAR" 200, Stock "CDXE" 500, Stock "BKWR" 250, Stock "BTSQ" 890, Stock "DRTY" 600] ['A','B', 'C']
