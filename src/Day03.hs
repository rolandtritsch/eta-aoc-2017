{-|
Problem: <https://adventofcode.com/2017/day/3>

Solution:

General - The idea is ...

* build a stream of moves
* from these moves build a stream of cells
* a cell has an index (starting from 0), coordinates (x, y - showing/
  describing the position of the cell relative to the center) and a value
  (the value of the cell).
* Note: For Part1 constructing the cell value is trivial (based on the
  index; value = index + 1). For Part2 it is more elaborate and requires
  to search the already evaluated stream for the 8 coordinates/values
  surrounding the cell that needs to be calculated.

Part 1 - Find the cell with the given value. Take the coordinates of
the cell and use them to calculate the [Manhatten-Distance]
(https://en.wikipedia.org/wiki/Taxicab_geometry) to the center
from it (realizing that the coordinates are effectively the
Manhatten-Distance :)).

Part 2 - Find the cell after the one with the given value and return
the value of that cell.

See also ...

* <https://oeis.org/A033951>
* <https://oeis.org/A141481>
-}
module Day03 where

import Util (inputRaw)

-- | read the input
input :: Int
input = read $ head $ inputRaw "input/Day03input.txt"

-- | possible moves
data Move = MoveUp | MoveDown | MoveLeft | MoveRight deriving (Show, Eq)

-- | relative offset to the current position (for all moves)
moveOffset :: (Num b, Num a) => Move -> (a, b)
moveOffset MoveUp = (1, 0)
moveOffset MoveDown = (-1, 0)
moveOffset MoveLeft = (0, -1)
moveOffset MoveRight = (0, 1)

-- | calculate the moves for a given level
movesOnLevelN :: Int -> [Move]
movesOnLevelN n =
  [MoveRight] ++
  replicate ((n * 2) - 1) MoveUp ++
  replicate (n * 2) MoveLeft ++
  replicate (n * 2) MoveDown ++
  replicate (n * 2) MoveRight

-- | generate an endless/lazy list/stream of moves
moves :: [Move]
moves = [m | n <- [1..], m <- movesOnLevelN n]

-- | a position has coordinates (x, y) relative to the center (0, 0)
type Position = (Int, Int)

-- | calc next position from current position and a moveOffset
nextPosition :: (Num a, Num b) => (a, b) -> (a, b) -> (a, b)
nextPosition (x, y) (xd, yd) = (x + xd, y + yd)

-- | a cell has a value and a position
data Cell = Cell {
  value :: Int,
  position :: Position
  } deriving (Show, Eq)

-- | calculate the manhatten distance for a cell
distance :: Cell -> Int
distance (Cell _ (x, y)) = abs x + abs y
