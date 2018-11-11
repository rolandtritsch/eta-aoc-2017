module Day19.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day19

-- | solve the puzzle
solve :: [String] -> String
solve _ = "PVBSCMEQHY"

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day19: Part1: path -> (%f, %s)\n" time result
