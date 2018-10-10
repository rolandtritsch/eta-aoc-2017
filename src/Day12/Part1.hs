-- Part1.hs
module Day12.Part1 where

import Day12

-- | solve the puzzle
solve :: Pipes -> Int
solve pipes = length $ findPrograms 0 pipes
