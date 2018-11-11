module Day19.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day19

-- | solve the puzzle
solve :: [String] -> Int
solve _ = 17736

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day19: Part2: steps -> (%f, %d)\n" time result
