module Day07.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day07

-- | solve the puzzle.
solve :: NodeMap -> Int
solve nodes = correctWeight $ findBadNode $ build nodes $ findRoot nodes

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day07: Part2: correctweight -> (%d, %f)\n" result time
