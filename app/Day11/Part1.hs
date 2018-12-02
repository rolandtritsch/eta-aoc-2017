module Day11.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day11

-- | solve the puzzle
solve :: [Direction] -> Int
solve moves = distance centerTile finalTile where
  (finalTile, _) = process moves

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day11: Part1: steps -> (%d, %f)\n" result time
