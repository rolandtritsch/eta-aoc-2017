{-|
Problem: <https://adventofcode.com/2017/day/11>

Solution:

General - Calculating the <https://en.wikipedia.org/wiki/Taxicab_geometry manhatten distance> on a <https://stackoverflow.com/a/47749887/2374327 hexagon grid>
is a well understood problem. The implementation of the algorithm will go
through the grid and will collect/calculate the finalDistance and the maxDistance
that was found/encountered on the way to the final tile.

Part1 - Return the (manhatten) distance of the final tile
from the center (tile).

Part2 - Return the max distance that was encountered while
getting/going to the final/target tile.
-}
module Day11 where

import Data.Text (split, pack, unpack)

import Util

type Direction = String

-- | read the input
input :: [Direction]
input = map unpack $ split ((==) ',') $ pack $ head $ inputRaw "input/Day11input.txt"
