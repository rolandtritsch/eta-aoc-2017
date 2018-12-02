{-# OPTIONS_GHC -fno-warn-type-defaults #-}
module Day23.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day23

-- | solve the puzzle
solve :: [String] -> Int
solve _ = length $ filter (not . isPrime) [first, second..end] where
  seed = 84
  first = seed * 100 + 100000
  end = first + 17000
  step = 17
  second = first + step
  isPrime n = null $ filter (\d -> (mod n d) == 0) $ takeWhile (\i -> i * i <= n) [2..n]

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day23: Part2: run -> (%d, %f)\n" result time
