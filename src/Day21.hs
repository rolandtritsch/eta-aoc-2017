{-|
Problem: <https://adventofcode.com/2017/day/21>

Solution:

General - This was a tricky one. First, you have to get the transformations
right. Means you read all of the rules from the input, but then you have to
*add* rules for all of the [[https://en.wikipedia.org/wiki/Dihedral_group_of_order_8 transformations ]]
(by flipping and rotating the input pattern).

We then need to implement a/the divide-enhance-join functions and call them
recursively for N iterations.

Part1 - Run divide-enhance-join for 5 iterations.

Part2 - Run divide-enhance-join for 18 iterations.
-}
module Day21 where

import Util

-- | read the input.
input :: [String]
input = inputRaw "input/Day21input.txt"
