module Day18.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day18

-- | solve the puzzle
solve :: [Assembler] -> Integer
solve program = (run initialState . instructions) program

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day18: Part1: frequency -> (%f, %d)\n" time result
