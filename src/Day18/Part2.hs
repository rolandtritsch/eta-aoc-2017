module Day18.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day18

-- | solve the puzzle
solve :: [String] -> Integer
solve _ = 7112

main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "TODO - Day18: Part2: deadlock -> (%f, %d)\n" time result
