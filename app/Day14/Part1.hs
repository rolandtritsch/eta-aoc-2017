module Day14.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day14

-- | solve the puzzle
solve :: String -> Int
solve key = (length . filter id . concat . buildGrid) key

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day14: Part1: used -> (%f, %d)\n" time result
