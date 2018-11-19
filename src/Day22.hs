{-|
Problem: <https://adventofcode.com/2017/day/22>

Solution:

General - Basicly I am implementing two grids (with a static/
pre-allocated size (not good; needs to be fixed)) and walk
these grids follwoing the rules in the problem statement.

Part1 - Walk the [[SimpleGrid]] and count the infections.

Part2 - Walk the [[AdvancedGrid]] and count the infections.
-}
module Day22 where

import Util

-- | read the input.
input :: [String]
input = inputRaw "input/Day22input.txt"
