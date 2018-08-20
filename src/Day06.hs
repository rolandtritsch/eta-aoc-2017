{-|
Problem: <https://adventofcode.com/2017/day/6>

Solution:

-}
module Day06 where

import Util (inputRaw)

-- | read the input
input :: [Int]
input = map read $ words $ head $ inputRaw "input/Day06input.txt"
