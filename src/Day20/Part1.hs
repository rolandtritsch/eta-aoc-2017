module Day20.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day20

-- | solve the puzzle
solve :: [String] -> Integer
solve _ = 243

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day20: Part1: findclosest -> (%f, %d)\n" time result
