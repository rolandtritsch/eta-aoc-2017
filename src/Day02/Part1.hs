-- Part1.hs
module Day02.Part1 where

import Day02

-- | calculate the checksum for every row
checksums :: [[Int]] -> [Int]
checksums rows = map process rows where
  process :: [Int] -> Int
  process row = maximum row - minimum row

-- | solve the puzzle
solve :: [[Int]] -> Int
solve input = sum $ checksums input
