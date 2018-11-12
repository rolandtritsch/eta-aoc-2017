{-|
Problem: <https://adventofcode.com/2017/day/19>

Solution:

General - Using a very simple state machine, that takes the current field
and the current direction and (based on these two inputs) decide what the
next state is. We can then (recursively) process states until we get out
of the maze.

Note: The structure of the problem/input allows to be "generous" with the
out of bounds checking for/in the maze (means I never check, if the array
access it out of bounds (which in theory it could be; especially when I
"look ahead" to find out which way to turn)).

Part1 - Collect all letters, while walking the maze.

Part2 - Count the steps, while walking the maze.
-}

module Day19 where

import Prelude hiding (Left, Right)

import Data.List (elemIndex)
import Data.Maybe (fromJust)

import Util

type Maze = [[Char]]

data Direction = Up | Down | Left | Right

data Position = Position Int Int

data State = State Maze Position Direction

data Info = Info String Integer

-- | read the input.
input :: Maze
input = (map id . map id . inputRaw) "input/Day19input.txt"

-- | get a value from the maze.
value :: Maze -> Position -> Char
value maze (Position row col) = (maze !! row) !! col

-- | moving through the maze.
movingUp :: Position -> Position
movingUp (Position row col) = Position (row - 1) col
movingDown :: Position -> Position
movingDown (Position row col) = Position (row + 1) col
movingLeft :: Position -> Position
movingLeft (Position row col) = Position row (col - 1)
movingRight :: Position -> Position
movingRight (Position row col) = Position row (col + 1)

-- | determine where to turn, when you are at a cross road.
doTurnLeft :: Maze -> Position -> Bool
doTurnLeft maze (Position row col) = value maze (Position row (col - 1)) == '-'
doTurnRight :: Maze -> Position -> Bool
doTurnRight maze (Position row col) = value maze (Position row (col + 1)) == '-'
doTurnUp :: Maze -> Position -> Bool
doTurnUp maze (Position row col) = value maze (Position (row - 1) col) == '|'
doTurnDown :: Maze -> Position -> Bool
doTurnDown maze (Position row col) = value maze (Position (row + 1) col) == '|'

-- | collect the information that we need about the walk.
collect :: Info -> String -> Info
collect (Info path steps) character = (Info (path ++ character) (steps + 1))

-- | take the current state and construct the next one from it.
next :: (State, Info) -> (State, Info)
next ((State maze position Up), info) = case (value maze position) of
  '|' -> (State maze (movingUp position) Up, (collect info ""))
  '-' -> (State maze (movingUp position) Up, (collect info ""))
  '+' | doTurnLeft maze position -> (State maze (movingLeft position) Left, (collect info ""))
  '+' | doTurnRight maze position -> (State maze (movingRight position) Right, (collect info ""))
  _ -> (State maze (movingUp position) Up, (collect info [value maze position]))
next ((State maze position Down), info) = case (value maze position) of
  '|' -> (State maze (movingDown position) Down, (collect info ""))
  '-' -> (State maze (movingDown position) Down, (collect info ""))
  '+' | doTurnLeft maze position -> (State maze (movingLeft position) Left, (collect info ""))
  '+' | doTurnRight maze position -> (State maze (movingRight position) Right, (collect info ""))
  _ -> (State maze (movingDown position) Down, (collect info [value maze position]))
next ((State maze position Left), info) = case (value maze position) of
  '|' -> (State maze (movingLeft position) Left, (collect info ""))
  '-' -> (State maze (movingLeft position) Left, (collect info ""))
  '+' | doTurnUp maze position -> (State maze (movingUp position) Up, (collect info ""))
  '+' | doTurnDown maze position -> (State maze (movingDown position) Down, (collect info ""))
  _ -> (State maze (movingLeft position) Left, (collect info [value maze position]))
next ((State maze position Right), info) = case (value maze position) of
  '|' -> (State maze (movingRight position) Right, (collect info ""))
  '-' -> (State maze (movingRight position) Right, (collect info ""))
  '+' | doTurnUp maze position -> (State maze (movingUp position) Up, (collect info ""))
  '+' | doTurnDown maze position -> (State maze (movingDown position) Down, (collect info ""))
  _ -> (State maze (movingRight position) Right, (collect info [value maze position]))

-- | check, if we are done.
done :: State -> Bool
done (State maze position _ ) = value maze position == ' '

-- | crawl through the maze.
crawl :: Maze -> Info
crawl maze = go ((State maze (Position 0 startCol) Down), (Info "" 0)) where
  startCol = fromJust $ elemIndex '|' (head maze)
  go c@(currentState, info)
    | done currentState = info
    | otherwise = go (next c)
