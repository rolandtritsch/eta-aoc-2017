-- Part1.hs
module Day16.Part1 where

import Day16

-- | solve the puzzle
solve :: [String] -> String
solve input' = solve' input' initialProgram

-- | solve (with initial program)
solve' :: [String] -> String -> String
solve' input'' initial = foldl apply initial (moves input'') where
  apply program move = move program
