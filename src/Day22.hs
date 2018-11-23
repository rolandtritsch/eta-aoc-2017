{-|
Problem: <https://adventofcode.com/2017/day/22>

Solution:

General - Basicly I am implementing two grids (with a static/
pre-allocated size (not good; needs to be fixed)) and walk
these grids follwoing the rules in the problem statement.

Part1 - Walk the [[SimpleGrid]] and count the infections.

Part2 - Walk the [[AdvancedGrid]] and count the infections.
-}
module Day22 where

import Prelude hiding (Left, Right)

import qualified Data.Map as M

import Util

data Direction
  = Up
  | Down
  | Left
  | Right
  deriving (Show, Eq)

data Position = Position Int Int deriving (Show, Eq, Ord)

data NodeState
  = Clean
  | Infected
  | Weakend
  | Flagged
  deriving (Show, Eq)

type GridArray = M.Map Position NodeState

data Grid = Grid GridArray Position Direction Int deriving (Show, Eq)

-- | buil the first/start grid.
input :: Grid
input = Grid (buildGrid inputGrid) (Position 0 0) Up 0

-- | read the grid from the input file.
inputGrid :: [[NodeState]]
inputGrid = (map processLine . inputRaw) "input/Day22input.txt" where
  processLine l = map processNode l where
    processNode '.' = Clean
    processNode '#' = Infected
    processNode _ = error "Unknown state char detected."

-- | build the (map-based) grid from the (list-based) input grid.
buildGrid :: [[NodeState]] -> GridArray
buildGrid ig = M.fromList nodes where
  midPoint = div (length ig) 2
  dimRange = [(negate midPoint)..midPoint]
  nodes = [((Position r c), get (r + midPoint) (c + midPoint)) | r <- dimRange, c <- dimRange]
  get r c = (ig !! r) !! c

-- | turn left.
turnLeft :: Direction -> Direction
turnLeft Up = Left
turnLeft Down = Right
turnLeft Left = Down
turnLeft Right = Up

-- | turn right.
turnRight :: Direction -> Direction
turnRight Up = Right
turnRight Down = Left
turnRight Left = Up
turnRight Right = Down

-- | find/lookup a/the state of a/the given node (assuming an
-- infinte 2D grid with clean nodes (as a default).
lookupState :: Position -> GridArray -> NodeState
lookupState p ga = M.findWithDefault Clean p ga

-- | check state of the node.
inState :: Position -> NodeState -> GridArray -> Bool
inState p s ga = lookupState p ga == s

-- | update the state grid with a new state.
updateState :: Position -> NodeState -> GridArray -> GridArray
updateState p s ga = M.insert p s ga

-- | do one move/step forward.
move :: Grid -> Grid
move (Grid g (Position row col) Up i) = Grid g (Position (row - 1) col) Up i
move (Grid g (Position row col) Down i) = Grid g (Position (row + 1) col) Down i
move (Grid g (Position row col) Left i) = Grid g (Position  row (col - 1)) Left i
move (Grid g (Position row col) Right i) = Grid g (Position row (col + 1)) Right i

-- | run the simulation for a number of bursts (with a/the burst function b).
runSimulation :: Int -> (Grid -> Grid) -> Grid -> Grid
runSimulation 0 _ g = g
runSimulation bursts burst g = runSimulation (bursts - 1) burst (move $ burst g)
