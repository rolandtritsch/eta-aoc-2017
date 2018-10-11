-- Part2.hs
module Day13.Part2 where

import Day13

-- | solve the puzzle
solve :: Layers -> Int
solve layers = go 0 where
  go delay
    | passThrough delay = delay
    | otherwise = go (delay + 1)
    where
      passThrough delay' = (calcSecScore $ buildFirewall layers delay') == 0
