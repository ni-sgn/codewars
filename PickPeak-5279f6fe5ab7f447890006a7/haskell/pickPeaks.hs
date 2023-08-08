module PickPeak where

data PickedPeaks = PickedPeaks { pos :: [Int], peaks :: [Int]} deriving (Eq, Show)

pickPeaks :: [Int] -> PickedPeaks
pickPeaks xs = PickedPeaks (fst $ unzip lst) (snd $ unzip lst) 
  where
    lst            = [ (i, (xs !! i)) | i <- [1 .. (length xs - 2)],
      (xs !! i) > (xs !! (i - 1)) && (xs !! i) > ( xs !! ((lastEqualIndex i xs) + 1))]


lastEqualIndex i ls = if i > ((length ls) - 3) then i else if (ls !! i) == (ls !! (i+1)) then lastEqualIndex (i+1) ls else i 

main :: IO ()
main = print $ pickPeaks [3,2,3,6,6,6,4,1,2,3,2,1,2,3]
