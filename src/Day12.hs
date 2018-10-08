{- |
Problem: <https://adventofcode.com/2017/day/12>

Solution:

General - A pipe is just an entry in a map that expresses
which program can communicate with which other program.

Part1 - To find the number of programs that are connected
to program 0, we just walk the tree. We start with the root (0)
and visit all children until we have seen all nodes. When we hit
a node that we have already seen we can stop looking (because we
know, that we have hit a loop). At the end we just need to return
the number of nodes we collected while we traversed the tree.

Part2 - To find the number of groups, we first take all nodes, then
we find all nodes that belong to group 0 (the group with the root 0).
Then we get rid of all nodes that are part of group 0, pick the first
node of the rest and build the next group. Then we diff the remaining
nodes with the ones that we just found group N. Until no nodes are
left over.
-}
module Day12 where

import Util

-- | read the input
input :: [String]
input = inputRaw "input/Day12input.txt"
