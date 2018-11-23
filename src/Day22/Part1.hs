module Day22.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day22

-- | do a burst.
burst :: Grid -> Grid
burst (Grid g p d i)
  | inState g p Infected = Grid (update p Clean g) p (turnRight d) i
  | inState g p Clean = Grid (update p Infected g) p (turnLeft d) (i + 1)
  | otherwise = error "Unknown state"

-- | solve the puzzle
solve :: Grid -> Int
solve grid = numberOfNodesThatGotInfected where
  (Grid _ _ _ numberOfNodesThatGotInfected) = runSimulation 10000 burst grid

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day22: Part1: simple -> (%f, %d)\n" time result
