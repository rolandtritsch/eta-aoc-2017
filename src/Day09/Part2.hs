-- Part2.hs
module Day09.Part2 where

import Day09

-- | solve the puzzle
solve :: String -> Int
solve input = chars $ foldl transition (InGroup 0 0 0) input where
  chars (InGroup 0 _ cs) = cs
