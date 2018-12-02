module Day25.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import qualified Data.Map as M

import Day25

-- | solve the puzzle
solve :: Integer -> Int
solve steps = checksum where
  (State _ tape _) = runSimulation steps (State A M.empty 0)
  checksum = length $ filter ((==) 1) (M.elems tape)

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day25: Part1: run -> (%d, %f)\n" result time
