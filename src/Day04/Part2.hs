-- Part2.hs
module Day04.Part2 where

import Data.List (sort)

import Day04
import qualified Day04.Part1 as P1

-- | to find the anagrams, we just need to sort the chars in the words first.
sortCharsInWords :: [[String]] -> [[String]]
sortCharsInWords = map $ map sort

-- | solve the puzzle. Input is a list of passphrases (every passphrase
-- is a list of words). Return the number of valid passphrases.
solve :: [[String]] -> Int
solve input = countValid P1.isValid $ sortCharsInWords $ input
