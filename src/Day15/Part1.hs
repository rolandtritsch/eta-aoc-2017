-- Part1.hs
module Day15.Part1 where

import Day15

-- | solve the puzzle
solve :: Int
solve = length $ filter (\(a, b) -> matching a b) $ take depth $ pairs where
  genConfigA = (703, 16807, 2147483647, 1)
  genConfigB = (516, 48271, 2147483647, 1)
  depth = 40000000
  pairs = zip (generator genConfigA) (generator genConfigB)
