{-|
Problem: <https://adventofcode.com/2017/day/25>

Solution:

General - And another [[State]] machine. Run the state machine for the
given number of steps/iterations (on the [[Tape]]).

Part1 - Calc and return the [[Tape.checkSum]].

Part2 - Merry Christmas :)
-}
module Day25 where

import Util

-- | read the input.
input :: [String]
input = inputRaw "input/Day25input.txt"
