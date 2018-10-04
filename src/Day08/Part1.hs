-- Part1.hs
module Day08.Part1 where

import qualified Data.Map as M

import Day08

-- | solve the puzzle
solve :: [Instruction] -> Int
solve instructions = maximum $ M.elems $ foldl exec M.empty instructions
