-- Day02.hs
module Day02 where

import Data.List.Split (splitOn)
import Util (inputRaw)

input :: [[Int]]
input = (map $ map (read :: String -> Int) . splitOn "\t") (inputRaw "input/Day02input.txt")

checksums :: [[Int]] -> [Int]
checksums rows = map checksum rows where
  checksum :: [Int] -> Int
  checksum row = maximum row - minimum row

evenlyDivisible :: [[Int]] -> [Int]
evenlyDivisible rows = map processRow rows where
    processRow :: [Int] -> Int
    processRow row = head [div x y | x <- row, y <- row, x > y, mod x y == 0]
