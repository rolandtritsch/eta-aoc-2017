module Day19.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day19

-- | solve the puzzle
solve :: Maze -> String
solve maze = path where
  (Info path _) = crawl maze

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day19: Part1: path -> (%s, %f)\n" result time
