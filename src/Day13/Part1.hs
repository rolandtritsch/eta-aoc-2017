-- Part1.hs
module Day13.Part1 where

import Day13

-- | solve the puzzle
solve :: Layers -> Int
solve layers = calcSecScore $ buildFirewall layers 0
