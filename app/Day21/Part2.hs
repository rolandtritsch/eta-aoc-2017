module Day21.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day21

-- | solve the puzzle
solve :: [Rule] -> Int
solve rs = countPixel $ runSimulation rs 18 startGrid

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day21: Part2: after18 -> (%f, %d)\n" time result
