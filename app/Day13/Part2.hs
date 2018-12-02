module Day13.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day13

-- | solve the puzzle
solve :: Layers -> Integer
solve layers = go 0 (buildFirewall layers) where
  go delay fw
    | passThrough = delay
    | otherwise = go (delay + 1) fw
    where
      passThrough = not $ fst $ calcSecScore delay fw

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day13: Part2: pass -> (%d, %f)\n" result time
