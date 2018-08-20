{-|
Problem: <https://adventofcode.com/2017/day/4>

Solution:

General - Build a histogram of all words in the passphrase
and make sure that there are no duplicates and last but not
least count the valid passphrases.

Part1 - Simple histogram.

Part2 - Now we need to detect anagrams. We do that simply
by sorting the chars in the words (two words with the same
chars in it are an anagram, right).

Note: Strictly speaking for Part2 you need to check Policy1
and Policy2 (this is how the problem/requirement is expressed),
but practically we only need to check Policy2, because Policy2
is a (stronger) superset of Policy1.
-}
module Day04 where

import Util (inputRaw)

-- | read the input
input :: [[String]]
input = (map words) $ inputRaw "input/Day04input.txt"

-- | count the valid passphrases
countValid :: ([String] -> Bool) -> [[String]] -> Int
countValid isValid input = length $ filter id $ map isValid input
