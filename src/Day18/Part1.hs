-- Part1.hs
module Day18.Part1 where

import qualified Data.Map.Strict as M

import Day18

-- | solve the puzzle
solve :: [Assembler] -> Int
solve program = (run (Running 0 M.empty) . instructions) program
