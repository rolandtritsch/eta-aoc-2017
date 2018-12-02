module Day16.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day16

-- | solve the puzzle
solve :: [String] -> String
solve programs = runProgram programs initialProgram

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day16: Part1: moves -> (%s, %f)\n" result time
