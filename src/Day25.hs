{-|
Problem: <https://adventofcode.com/2017/day/25>

Solution:

General - And another [[State]] machine. Run the state machine for the
given number of steps/iterations (on the [[Tape]]).

Part1 - Calc and return the [[Tape.checkSum]].

Part2 - Merry Christmas :)
-}
module Day25 where

import qualified Data.Map as M

import Util

type Tape = M.Map Integer Integer

data StateState = A | B | C | D | E | F
data State = State StateState Tape Integer

-- | read the input.
input :: Integer
input = numberOfSteps where
  allLines = inputRaw "input/Day25input.txt"
  secondLine = allLines !! 1
  numberOfSteps = read $ (words secondLine) !! 5

-- | get current value on the tape.
currentValue :: Integer -> Tape -> Integer
currentValue pc tape = M.findWithDefault 0 pc tape

-- | run the simulation.
runSimulation :: Integer -> State -> State
runSimulation 0 s = s
runSimulation steps (State A tape pc)
  | currentValue pc tape == 0 = runSimulation (steps - 1) (State B (M.insert pc 1 tape) (pc + 1))
  | currentValue pc tape == 1 = runSimulation (steps - 1) (State C (M.insert pc 0 tape) (pc - 1))
  | otherwise = error "Unexpected value"
runSimulation steps (State B tape pc)
  | currentValue pc tape == 0 = runSimulation (steps - 1) (State A (M.insert pc 1 tape) (pc - 1))
  | currentValue pc tape == 1 = runSimulation (steps - 1) (State D (M.insert pc 1 tape) (pc + 1))
  | otherwise = error "Unexpected value"
runSimulation steps (State C tape pc)
  | currentValue pc tape == 0 = runSimulation (steps - 1) (State B (M.insert pc 0 tape) (pc - 1))
  | currentValue pc tape == 1 = runSimulation (steps - 1) (State E (M.insert pc 0 tape) (pc - 1))
  | otherwise = error "Unexpected value"
runSimulation steps (State D tape pc)
  | currentValue pc tape == 0 = runSimulation (steps - 1) (State A (M.insert pc 1 tape) (pc + 1))
  | currentValue pc tape == 1 = runSimulation (steps - 1) (State B (M.insert pc 0 tape) (pc + 1))
  | otherwise = error "Unexpected value"
runSimulation steps (State E tape pc)
  | currentValue pc tape == 0 = runSimulation (steps - 1) (State F (M.insert pc 1 tape) (pc - 1))
  | currentValue pc tape == 1 = runSimulation (steps - 1) (State C (M.insert pc 1 tape) (pc - 1))
  | otherwise = error "Unexpected value"
runSimulation steps (State F tape pc)
  | currentValue pc tape == 0 = runSimulation (steps - 1) (State D (M.insert pc 1 tape) (pc + 1))
  | currentValue pc tape == 1 = runSimulation (steps - 1) (State A (M.insert pc 1 tape) (pc + 1))
  | otherwise = error "Unexpected value"
