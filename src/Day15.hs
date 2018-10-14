{-|
Problem: <https://adventofcode.com/2017/day/15>

Solution:

General - This was heavily refactored. Twice :). I started with a stream
based/recursive approach. Then I tried to *just* use the stream (with take/count),
but stream is an IteraterableAgain and that means it keeps the front of the stream
around and that means we (sooner or later) run out of mem (initially using Strings
did not help either; with the mem and the performance). The right approach is
obviously to use an Iterator. And then do a recursion.

Part1 - solve the puzzle with a modolo of (1, 1) and a depth of 40 * 10e6.

Part2 - solve the puzzle with a modolo of (4, 8) and a depth of 5 * 10e6.
-}
module Day15 where

--import Util

-- | read the input
input :: String
input = ""
