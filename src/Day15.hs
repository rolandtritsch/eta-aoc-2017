{-|
Problem: <https://adventofcode.com/2017/day/15>

Solution:

General - (Much) Easi(er) in Haskell. Just use iterate right.

Part1 - solve the puzzle with a modolo of (1, 1) and a depth of 40 * 10e6.

Part2 - solve the puzzle with a modolo of (4, 8) and a depth of 5 * 10e6.
-}
module Day15 where

import Data.Int (Int64)
import Data.Bits ((.&.))

-- | generate an infinte list of elements (based on a/the generator config)
generator :: (Int64, Int64, Int64, Int64) -> [Int64]
generator (start, factor, divider, multiple) = tail $ filter (criteria multiple) $ iterate next start where
  criteria multiple' value = (mod value multiple') == 0
  next previous = rem (previous * factor) divider

-- | check, if the two numbers match (lower 16 bits are equal)
matching :: Int64 -> Int64 -> Bool
matching a b = (a .&. 0xffff) == (b .&. 0xffff)
