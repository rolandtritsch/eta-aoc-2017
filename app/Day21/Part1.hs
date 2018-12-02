module Day21.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day21

-- | solve the puzzle
solve :: [Rule] -> Int
solve rs = countPixel $ runSimulation rs 5 startGrid

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day21: Part1: after5 -> (%d, %f)\n" result time
