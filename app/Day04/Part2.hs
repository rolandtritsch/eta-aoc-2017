module Day04.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Data.List (sort)

import Day04

-- | to find the anagrams, we just need to sort the chars in the words first.
sortCharsInWords :: [[String]] -> [[String]]
sortCharsInWords = map $ map sort

-- | solve the puzzle. Input is a list of passphrases (every passphrase
-- is a list of words). Return the number of valid passphrases.
solve :: [[String]] -> Int
solve phrases = countValid isValid $ sortCharsInWords $ phrases

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day04: Part2: countvalid -> (%f, %d)\n" time result
