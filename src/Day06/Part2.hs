-- Part1.hs
module Day06.Part2 where

import Day06

-- | solve the puzzle
solve :: MemoryBanks -> Int
solve input = lambda where
  (lambda, _) = floyd Day06.cycle input
