-- Part1.hs
module Day14.Part1 where

import Day14

-- | solve the puzzle
solve :: String -> Int
solve key = (length . filter id . concat . buildGrid) key
