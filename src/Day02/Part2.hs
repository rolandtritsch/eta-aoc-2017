-- Part2.hs
module Day02.Part2 where

import Day02

solve :: [[Int]] -> Int
solve input = sum $ evenlyDivisible input
