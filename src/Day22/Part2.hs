module Day22.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day22

-- | do a burst.
burst :: Grid -> Grid
burst (Grid g p d i)
  | inState p Clean g = Grid (updateState p Weakend g) p (turnLeft d) i
  | inState p Weakend g = Grid (updateState p Infected g) p d (i + 1)
  | inState p Infected g = Grid (updateState p Flagged g) p (turnRight d) i
  | inState p Flagged g = Grid (updateState p Clean g) p (turnRight $ turnRight d) i
  | otherwise = error "Unknown state"

-- | solve the puzzle.
solve :: Grid -> Int
solve grid = numberOfNodesThatGotInfected where
  (Grid _ _ _ numberOfNodesThatGotInfected) = runSimulation 10000000 burst grid

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day22: Part2: advanced -> (%f, %d)\n" time result
