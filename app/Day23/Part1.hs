module Day23.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day23

-- | solve the puzzle
solve :: [Assembler] -> Integer
solve program = (runProgram initialState . instructions) program

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day23: Part1: run -> (%d, %f)\n" result time
