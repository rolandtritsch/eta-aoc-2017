{-|
Problem: <https://adventofcode.com/2017/day/14>

Solution:

General - Using the solution from Day10, we are calculating
the 128x128 bit hash grid. Note: Instead of a grid of chars
[#.] I am using a grid of booleans.

Part1 - We are counting all the trues in the hashes.

Part2 - Is a little bit more tricky. I decided to look at it
as a tree search problem. I visit every square and if it is
used I recursively visit all adjacent squares until there are
no more squares to visit (means I have now visited and collected
all squares of the region). I do this for the entire grid and
will end up with a/the list of root nodes (coordinates) for
all regions.
-}
module Day14 where

import Util

-- | read the input
input :: String
input = head $ inputRaw "input/Day14input.txt"
