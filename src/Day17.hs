{-|
Problem: <https://adventofcode.com/2017/day/17>

Solution:

General - (At least Part 1 is ...) Straight-forward. Take a (mutable) list and
define the required operations on it.

Part1 - Run the algorithm 2017 times with a step size of 371 (input).

Part2 - Big trick here! Build a/the list with 50000000 elements in it is not possible
(takes too long and takes too much main mem). But we can take a short-cut by (just) moving
through the list (virtually) and calculate the insert postions and every time we insert a
value after postion 0, we remember it. The last time we insert something after position 0
gives us the solution.
-}
module Day17 where

import Util

-- | read the input
input :: Int
input = read $ head $ inputRaw "input/Day17input.txt"

-- | step (forward) in/on circular buffer
forward :: Int -> Int -> Int -> Int
forward step position size = mod (position + step) size

-- | insert element at/after position
insertAt :: a -> Int -> [a] -> [a]
insertAt element position buffer = head' ++ [element] ++ tail' where
  (head', tail') = splitAt (position + 1) buffer

-- | apply a/the number of steps (and return the final position/buffer).
stepAndInsert :: Int -> Int -> (Int, [Int])
stepAndInsert steps times = foldl go (0, [0]) [1..times] where
  go (currentPosition, currentBuffer) i = (nextPosition, nextBuffer) where
    insertPosition = forward steps currentPosition (length currentBuffer)
    nextBuffer = insertAt i insertPosition currentBuffer
    nextPosition = insertPosition + 1
