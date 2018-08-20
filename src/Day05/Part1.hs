-- Part1.hs
module Day05.Part1 where

import Day05

offset :: Int -> Int
offset counter = counter + 1

-- | solve the puzzle.
solve :: Stack -> Int
solve input = jump input 0 offset 0
