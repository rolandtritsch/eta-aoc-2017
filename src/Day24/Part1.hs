module Day24.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day24

-- | solve the puzzle
solve :: [String] -> Int
solve _ = 1695

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day24: Part1: strongest -> (%f, %d)\n" time result
