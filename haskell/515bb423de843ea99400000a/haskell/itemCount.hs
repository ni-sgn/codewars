module Pagination where

type Collection a = [a]
type ItemsPerPage = Int

itemCount :: Collection a -> Int
itemCount = length 

pageCount :: Collection a -> ItemsPerPage -> Int
pageCount xs n =  
  let 
    (a,b) = divMod (length xs) n 
  in 
    if b > 0 then a + 1 else a

pageItemCount :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageItemCount xs n page = 
  let 
    l                      = length xs
    (pages, lastPageItems) = divMod l n
  in
    if page < 0 || page > l 
    then Nothing
    else if pages == page && lastPageItems /= 0 
    then Just lastPageItems 
    else if page < pages 
    then Just n 
    else Nothing

pageIndex :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageIndex xs n item = 
  let
    pageIndices = zip [0..] $ map (\i -> [i*n .. (i+1)*n-1]) [0..div (length xs) n]
    filtered    = filter (\(a,b) -> elem item b) pageIndices
  in
    if item >= (length xs) || item < 0 then Nothing else if null filtered then Nothing else Just $ fst $ head filtered

