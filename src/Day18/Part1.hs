module Day18.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import qualified Data.Map.Strict as M

import Day18

-- | solve the puzzle
solve :: [Assembler] -> Integer
solve program = (run (Running 0 M.empty) . instructions) program

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day18: Part1: frequency -> (%f, %d)\n" time result
