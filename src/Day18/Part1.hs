-- Part1.hs
module Day18.Part1 where

import qualified Data.Map.Strict as M

import Day18

-- | solve the puzzle
solve :: [String] -> Int
solve input' = (run (0, M.empty, False, 0) . instructions) input'
