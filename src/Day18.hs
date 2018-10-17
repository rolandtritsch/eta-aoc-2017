{-|
Problem: <https://adventofcode.com/2017/day/18>

Solution:

General - First we need to implement all of the operations. We then
execute the progrom by executing all instructions (the input). Running
the program can be parameterized by `when is the program done?` and
`what do we do when we exit?`.

Note: To solve the puzzle(s) we need two program instances to talk
to each other (send/receive register values (frequencies)). For that
to happen I am using a blocking queue between the instances.

Note: The instruction on line 35 is >jgz 1 3<. Not sure, if this is
a typo. I changed it to >jgz l 3< and added >set l 1< as the first
instruction in the input file.

Part1 - Simple. Run the program. When we exit we need to return the
value of the recovered frequency (the value of the most recently
played sound; basically most recent value in the queue). We are done,
the first time a receive instruction is executed with a non-zero value.

Part2 - Also (kind of) simple (after some refactoring; using Future and
replacing LinkedBlockingDeque with Queue). Run until both sides are waiting
(i.e. are deadlocked) and (at that point in time) return/exit with the
writeCount.
-}
module Day18 where

import Util

-- | read the input
input :: [String]
input = inputRaw "input/Day18input.txt"
