module Day05.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day05

-- | the offset for Part1
offset :: Int -> Int
offset counter = counter + 1

-- | solve the puzzle.
solve :: Stack -> Int
solve stack = jump stack 0 offset 0

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day05: Part1: countsteps -> (%f, %d)\n" time result
