module Day13.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day13

-- | solve the puzzle
solve :: Layers -> Integer
solve layers = snd $ calcSecScore 0 $ buildFirewall layers

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day13: Part1: score -> (%d, %f)\n" result time
