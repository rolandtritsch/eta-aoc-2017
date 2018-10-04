-- Part1.hs
module Day10.Part1 where

import Day10

-- | solve the puzzle
solve :: String -> Int
solve input' = foldl (*) 1 $ take 2 $ hash $ knot (input2Lengths input') seed
