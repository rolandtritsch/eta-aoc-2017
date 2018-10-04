-- Part1.hs
module Day06.Part1 where

import Day06

-- | solve the puzzle
solve :: MemoryBanks -> Int
solve banks = lambda + mu where
  (lambda, mu) = floyd Day06.cycle banks
