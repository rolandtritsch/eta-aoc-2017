module Day20.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Data.List.Unique (unique)

import Day20

-- | run the simulation with collision detection for a given number of ticks.
runSimulation :: Integer -> [Particle] -> [Particle]
runSimulation 0 ps = ps
runSimulation depth ps = runSimulation (depth - 1) (unique $ map tick ps)

-- | solve the puzzle.
solve :: [Particle] -> Integer
solve ps = toInteger $ length atEndOfSimlation where
  atEndOfSimlation = runSimulation 1000 ps

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day20: Part2: nocollisions -> (%d, %f)\n" result time
