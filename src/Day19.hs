{-|
Problem: <https://adventofcode.com/2017/day/19>

Solution:

General - Using a very simple state machine, that takes the current field
and the current direction and (based on these two inputs) decide what the
next state is. We can then (recursively) process states until we get out
of the maze.

Part1 - Collect all letters, while walking the maze.

Part2 - Count the steps, while walking the maze.
-}

module Day19 where

import Util

-- | read the input
input :: [String]
input = inputRaw "input/Day19input.txt"
