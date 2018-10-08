-- Part1.hs
module Day11.Part1 where

import Day11

-- | solve the puzzle
solve :: [Direction] -> Int
solve moves = distance centerTile finalTile where
  (finalTile, _) = process moves
