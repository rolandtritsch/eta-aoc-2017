module Day24.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day24

-- | solve the puzzle
solve :: [Component] -> Integer
solve cs = maximum $ map sum bs where
  bs = bridges $ root cs

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day24: Part1: strongest -> (%d, %f)\n" result time
