-- Part1.hs
module Day09.Part1 where

import Day09

-- | solve the puzzle
solve :: String -> Int
solve input = score $ foldl transition (InGroup 0 0 0) input where
  score (InGroup 0 s _) = s
