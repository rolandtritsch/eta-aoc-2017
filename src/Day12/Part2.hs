-- Part2.hs
module Day12.Part2 where

import Day12

-- | solve the puzzle
solve :: Pipes -> Int
solve pipes = length $ findGroups pipes
