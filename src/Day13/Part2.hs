module Day13.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day13

-- | solve the puzzle
solve :: Layers -> Int
solve layers = go 0 where
  go delay
    | passThrough delay = delay
    | otherwise = go (delay + 1)
    where
      passThrough delay' = (calcSecScore $ buildFirewall layers delay') == 0

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day13: Part2: pass -> (%f, %d)\n" time result
