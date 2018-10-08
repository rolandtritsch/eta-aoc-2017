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
type Tile = (Int, Int, Int)

-- | the center tile
centerTile :: Tile
centerTile = (0, 0, 0)

-- | read the input
input :: [Direction]
input = map unpack $ split ((==) ',') $ pack $ head $ inputRaw "input/Day11input.txt"

-- | calculate a/the distance between two tiles
distance :: Tile -> Tile -> Int
distance (x0, y0, z0) (x1, y1, z1) = div ((abs (x0 - x1)) + (abs (y0 - y1)) + (abs (z0 - z1))) 2

-- | calc the next tile (based on the current tile and the current direction)
next :: Tile -> Direction -> Tile
next (x, y, z) "n"  = (x, y + 1, z - 1)
next (x, y, z) "ne" = (x + 1, y, z - 1)
next (x, y, z) "nw" = (x - 1, y + 1, z)
next (x, y, z) "s"  = (x, y - 1, z + 1)
next (x, y, z) "se" = (x + 1, y - 1, z)
next (x, y, z) "sw" = (x - 1, y, z + 1)
next _ _ = error "Unknown direction"

-- | process all moves and return the resulting tile (and the max distance encountered)
process :: [Direction] -> (Tile, Int)
process moves = foldl process' (centerTile, 0) moves where
  process' (currentTile, maxDistance) currentMove = (nextTile, nextMax) where
    nextTile = next currentTile currentMove
    nextMax = max maxDistance (distance centerTile nextTile)
