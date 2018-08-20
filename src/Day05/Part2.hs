-- Part2.hs
module Day05.Part2 where

import Day05

-- | the offset for Part2
offset :: Int -> Int
offset counter
  | counter >= 3 = counter - 1
  | otherwise = counter + 1

-- | solve the puzzle.
solve :: Stack -> Int
solve input = jump input 0 offset 0
