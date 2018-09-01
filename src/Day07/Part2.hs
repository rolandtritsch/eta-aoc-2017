-- Part1.hs
module Day07.Part2 where

import Day07

-- | solve the puzzle.
solve :: NodeMap -> Int
solve input = correctWeight $ findBadNode $ build input $ findRoot input
