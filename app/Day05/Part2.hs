module Day05.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day05

-- | the offset for Part2
offset :: Int -> Int
offset counter
  | counter >= 3 = counter - 1
  | otherwise = counter + 1

-- | solve the puzzle.
solve :: Stack -> Int
solve stack = jump stack 0 offset 0

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day05: Part2: countsteps -> (%d, %f)\n" result time
