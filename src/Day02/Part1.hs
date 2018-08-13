-- Part1.hs
module Day02.Part1 where

import Day02

solve :: [[Int]] -> Int
solve input = sum $ checksums input
