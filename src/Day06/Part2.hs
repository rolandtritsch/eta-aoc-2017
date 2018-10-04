-- Part1.hs
module Day06.Part2 where

import Day06

-- | solve the puzzle
solve :: MemoryBanks -> Int
solve banks = lambda where
  (lambda, _) = floyd Day06.cycle banks
