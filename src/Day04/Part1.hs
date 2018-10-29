module Day04.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day04

-- | solve the puzzle. Input is a list of passphrases (every passphrase
-- is a list of words). Return the number of valid passphrases.
solve :: [[String]] -> Int
solve phrases = countValid isValid phrases

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day04: Part1: countvalid -> (%f, %d)\n" time result
