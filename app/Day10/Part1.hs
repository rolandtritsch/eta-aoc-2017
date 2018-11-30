module Day10.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day10

-- | solve the puzzle
solve :: String -> Int
solve input' = foldl (*) 1 $ take 2 $ hash $ knot (input2Lengths input') seed

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day10: Part1: knot -> (%f, %d)\n" time result
