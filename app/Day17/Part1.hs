module Day17.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day17

-- | solve the puzzle
solve :: Int -> Int
solve steps = buffer !! mod (position + 1) (length buffer)  where
  (position, buffer) = stepAndInsert steps 2017

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day17: Part1: next -> (%d, %f)\n" result time
