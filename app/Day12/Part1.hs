module Day12.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day12

-- | solve the puzzle
solve :: Pipes -> Int
solve pipes = length $ findPrograms 0 pipes

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day12: Part1: programs -> (%d, %f)\n" result time
