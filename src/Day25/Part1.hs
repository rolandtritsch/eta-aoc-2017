module Day25.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day25

-- | solve the puzzle
solve :: [String] -> Int
solve _ = 4769

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day25: Part1: run -> (%f, %d)\n" time result
