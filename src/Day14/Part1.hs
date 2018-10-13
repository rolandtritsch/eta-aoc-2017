-- Part1.hs
module Day14.Part1 where

import Day14

-- | solve the puzzle
solve :: String -> Int
solve key = (foldl countTrue 0 . buildGrid) key where
  countTrue sumSoFar row = sumSoFar + (length . filter id) row
