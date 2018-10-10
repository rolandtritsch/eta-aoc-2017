{-|
Problem: <https://adventofcode.com/2017/day/13>

Solution:

General - First implementation was a simulation. That turned out to be too slow
for Part2. Second implementation is calculating the solution/collisions. The main
idea is that the layers correspond to the number of picosecs, after 0 picosecs we
are on layer 0, after 1 on layer 1, and so on. With that it is easy to calculate,
if the packet gets dedected at/on that layer in the firewall ((number of picosecs)
modolo (the range of the scanner)).

Part1 - Fold through the layers of the firewall and sum up the security score of
every layer, where the threat gets detected.

Part2 - Add an offset/delay to the depth of the layers of the firewall. Increase
the delay until we can pass through the firewall undetected.
-}
module Day13 where

import Util

-- | read the input
input :: [String]
input = inputRaw "input/Day13input.txt"
