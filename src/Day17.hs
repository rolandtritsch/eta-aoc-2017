{-|
Problem: <https://adventofcode.com/2017/day/17>

Solution:

General - Straight-forward. Take a mutable ListBuffer (for performance reasons) and
define the required operations on it.

Part1 - Run the algorithm 2017 times with a step size of 371 (input).

Part2 - A little bit more tricky. Build a/the list with 50000000 elements in it is
not possible (takes too long and takes too much main mem). But we can take a short-cut
by (just) moving through the list (virtually) and calculate the insert postions and
every time we insert a value after postion 0, we remember it. The last time we insert
something after position 0 gives us the solution.
-}
module Day17 where

import Util

-- | read the input
input :: Int
input = read $ head $ inputRaw "input/Day17input.txt"
