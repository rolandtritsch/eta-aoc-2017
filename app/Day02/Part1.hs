module Day02.Part1 where

import System.TimeIt (timeItT)
import Text.Printf (printf)
import Control.Exception (evaluate)

import Day02

-- | calculate the checksum for every row
checksums :: [[Int]] -> [Int]
checksums rows = map process rows where
  process :: [Int] -> Int
  process row = maximum row - minimum row

-- | solve the puzzle
solve :: [[Int]] -> Int
solve rows = sum $ checksums rows

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day02: Part1: checksum -> (%f, %d)\n" time result
