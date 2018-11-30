module Day16.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day16

-- | solve the puzzle
solve :: [String] -> String
solve input' = solve' input' initialProgram

-- | solve (with initial program)
solve' :: [String] -> String -> String
solve' input'' initial = foldl apply initial (moves input'') where
  apply program move = move program

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day16: Part1: moves -> (%f, %s)\n" time result
