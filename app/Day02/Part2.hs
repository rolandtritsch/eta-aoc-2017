module Day02.Part2 where

import System.TimeIt (timeItT)
import Text.Printf (printf)
import Control.Exception (evaluate)

import Day02

-- | calculate the evenlyDivisible for every row
evenlyDivisible :: [[Int]] -> [Int]
evenlyDivisible rows = map process rows where
    process :: [Int] -> Int
    process row = head [div x y | x <- row, y <- row, x > y, mod x y == 0]

-- | solve the puzzle
solve :: [[Int]] -> Int
solve rows = sum $ evenlyDivisible rows

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day02: Part2: checksum -> (%f, %d)\n" time result
