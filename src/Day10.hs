{-|
Problem: <https://adventofcode.com/2017/day/10>

Solution:

General - Nothing special here. Just very careful reading
of the problem statement and the requirements that come
with it.

Part1 - Implement the knot.

Part2 - Implement the sparse/dense hash.
-}
module Day10 where

import Util

-- | read the input
input :: String
input = head $ inputRaw "input/Day10input.txt"
