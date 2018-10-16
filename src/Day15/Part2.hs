-- Part2.hs
module Day15.Part2 where

import Day15

-- | solve the puzzle
solve :: Int
solve = length $ filter (\(a, b) -> matching a b) $ take depth $ pairs where
  genConfigA = (703, 16807, 2147483647, 4)
  genConfigB = (516, 48271, 2147483647, 8)
  depth = 5000000
  pairs = zip (generator genConfigA) (generator genConfigB)
