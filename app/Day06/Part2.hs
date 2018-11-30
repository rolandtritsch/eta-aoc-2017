module Day06.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day06

-- | solve the puzzle
solve :: MemoryBanks -> Int
solve banks = lambda where
  (lambda, _) = floyd Day06.cycle banks

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day06: Part2: cycles -> (%f, %d)\n" time result
