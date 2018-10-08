-- Part2.hs
module Day11.Part2 where

import Day11

-- | solve the puzzle
solve :: [Direction] -> Int
solve moves = maxDistance where
  (_, maxDistance) = process moves
