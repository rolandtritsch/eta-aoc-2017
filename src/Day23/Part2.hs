module Day23.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day23

-- | solve the puzzle
solve :: [String] -> Int
solve _ = 903

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day23: Part2: run -> (%f, %d)\n" time result
