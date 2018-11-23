{-|
Problem: <https://adventofcode.com/2017/day/23>

Solution:

General - This was a difficult one (at least for me). Part1 is
straightforward enough, but I really struggled to get Part2 done.
For Part1 I implemented a *normal* [[Operation]]-interpreter to
run the [[Program]]. But this prooved to be way too slow to solve
Part2. From the discussion group I then realized that I have to
reverse engineer the code to find out what it is doing and write
a compilable version of that code. First I annotated the code
in Day23Input.txt.annotated.

Part1 - Build a list of [[Operation]]s to run the [[Program]].

Part2 - Implement the algorithm above in [[Part2.solve]].
-}
module Day23 where

import Util

-- | read the input.
input :: [String]
input = inputRaw "input/Day23input.txt"
