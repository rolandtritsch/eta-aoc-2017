module Day16.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day16

-- | solve the puzzle
solve :: [String] -> String
solve programs = foldl solve' initialProgram [1..(mod 1000000 times)] where
  solve' p _ = runProgram programs p
  times = findLoop programs initialProgram (runProgram programs initialProgram) 1

-- | find out after how many times the dance repeats itself
findLoop :: [String] -> String -> String -> Int -> Int
findLoop programs inital current times
  | inital == current = times
  | otherwise = findLoop programs inital (runProgram programs current) (times + 1)

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day16: Part2: dance -> (%s, %f)\n" result time
