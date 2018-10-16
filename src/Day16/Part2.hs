-- Part2.hs
module Day16.Part2 where

import Day16
import qualified Day16.Part1 as P1

-- | solve the puzzle
solve :: [String] -> String
solve input' = foldl solve' initialProgram [1..(mod 1000000 times)] where
  solve' p _ = P1.solve' input' p
  times = findLoop input' initialProgram (P1.solve' input' initialProgram) 1

-- | find out after how many times the dance repeats itself
findLoop :: [String] -> String -> String -> Int -> Int
findLoop input'' inital current times
  | inital == current = times
  | otherwise = findLoop input'' inital (P1.solve' input'' current) (times + 1)
