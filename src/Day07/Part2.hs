-- Part1.hs
module Day07.Part2 where

import Day07

-- | solve the puzzle.
solve :: [ParseElement] -> Int
solve input = correctWeight (findBadNode (build input Root (findRoot input)))
