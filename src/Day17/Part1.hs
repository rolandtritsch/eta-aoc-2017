-- Part1.hs
module Day17.Part1 where

import Day17

-- | solve the puzzle
solve :: Int -> Int
solve steps = buffer !! mod (position + 1) (length buffer)  where
  (position, buffer) = stepAndInsert steps 2017
