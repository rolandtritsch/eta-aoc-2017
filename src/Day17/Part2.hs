-- Part2.hs
module Day17.Part2 where

import Day17

-- | solve the puzzle
solve :: Int -> Int
solve steps = value where
  (_, value) = foldl go (0, 0) [1..50000000] where
    go (currentPosition, currentValue) currentSize
      | nextPosition == 0 = (nextPosition + 1, currentSize)
      | otherwise = (nextPosition + 1, currentValue)
      where
        nextPosition = forward steps currentPosition currentSize
