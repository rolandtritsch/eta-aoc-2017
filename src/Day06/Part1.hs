-- Part1.hs
module Day06.Part1 where

import Day06

-- | solve the puzzle
solve :: MemoryBanks -> Int
solve input = lambda + mu where
  (lambda, mu) = floyd Day06.cycle input
