module CanYouGetTheLoop where

import Data.List  (elemIndex)
import Data.Maybe (fromJust)

data Node   a = Node a (Node a)

instance Eq a => Eq (Node a) where
  (==) (Node a node) (Node a' node') = (a == a') 
  (/=) (Node a node) (Node a' node') = (a /= a') 

instance Show a => Show (Node a) where
  show (Node a node) = show a

-- Tying a Knot
-- must take notes about this
testNode :: Node Int
testNode =
    let node1 = Node 1 node2
        node2 = Node 2 node3
        node3 = Node 3 node4
        node4 = Node 4 node1
    in node1


next :: Eq a => Node a -> Node a
next (Node v n) = n

loopSize :: Eq a => Node a -> Int
loopSize = lp [] 

lp ::  Eq a => [a] -> Node a -> Int 
lp xs (Node v n)  
  | v `elem` xs    =  (+1) $ length $ takeWhile (/= v) xs
  | otherwise      =  lp (v : xs) (next (Node v n)) 

main :: IO ()
main = print $ lp [] testNode
