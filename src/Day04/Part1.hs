-- Part1.hs
module Day04.Part1 where

import Data.List.Unique

import Day04

-- | check, if a given passphrase is valid
isValid :: [String] -> Bool
isValid phrase = repeated phrase == []

-- | solve the puzzle. Input is a list of passphrases (every passphrase
-- is a list of words). Return the number of valid passphrases.
solve :: [[String]] -> Int
solve phrases = countValid isValid phrases
