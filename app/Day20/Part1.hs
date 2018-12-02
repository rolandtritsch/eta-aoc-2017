module Day20.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Data.Maybe (fromJust)
import Data.List (elemIndex)

import Day20

-- | (for the given particles) find the index of the particle with
-- the smallest distance (to/from the origin (0, 0, 0)).
findClosest :: [Particle] -> Integer
findClosest ps =  toInteger $ fromJust $ elemIndex (minimum distances) distances where
  distances = (map distanceFromOrigin . map position) ps where
    position (Particle p _ _) = p

-- | run the simulation for a given number of ticks.
runSimulation :: Integer -> [Particle] -> [Particle]
runSimulation 0 ps = ps
runSimulation depth ps = runSimulation (depth - 1) (map tick ps)

-- | solve the puzzle
solve :: [Particle] -> Integer
solve ps = findClosest atEndOfSimlation where
  atEndOfSimlation = runSimulation 1000 ps

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day20: Part1: findclosest -> (%d, %f)\n" result time
