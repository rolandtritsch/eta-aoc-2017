module Day07.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day07

-- | solve the puzzle
solve :: NodeMap -> String
solve nodes = findRoot nodes

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day07: Part1: findroot -> (%s, %f)\n" result time
