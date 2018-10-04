-- Part1.hs
module Day07.Part2 where

import Day07

-- | solve the puzzle.
solve :: NodeMap -> Int
solve nodes = correctWeight $ findBadNode $ build nodes $ findRoot nodes
