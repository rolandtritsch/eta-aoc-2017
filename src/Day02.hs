{-|
Problem: [[https://adventofcode.com/2017/day/2]]

Solution:

Part 1 - Straight forward. For every row, build a/the tuple
of the largest and the smallest value in that row. Calc the
diffs and sum them up.

Part 2 - A little bit more interesting. Build the pairs of all
values in a row (but only the ones where x > y), filter for the
one pair where x is divisible by y with no remainder and sum up
the result of the division.
-}
module Day02 where

import Data.List.Split (splitOn)
import Util (inputRaw)

-- | read the input
input :: [[Int]]
input = (map $ map (read :: String -> Int) . splitOn "\t") (inputRaw "input/Day02input.txt")
