{-|
Problem: <https://adventofcode.com/2017/day/16>

Solution:

General - Kind of simple. Take a program and a move and execute
the move on the program. Take all moves and execute all of them
one after the other (executeMoves). Then (for Part2) execute all
moves on a/the program 1000000000 times.

Part1 - execute the moves (once).

Part2 - execute the moves 1000000000 times (execute the dance).
The big trick here is to realize that there is a loop in the
dance and that the dance is repeating itself after N iterations,
means you can ignore the first M times the dance is executed and
need todo the remainder to find the final position.
-}
module Day16 where

import Util

-- | read the input.
input :: String
input = head $ inputRaw "input/Day16input.txt"
