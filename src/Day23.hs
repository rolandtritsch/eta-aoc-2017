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

import qualified Data.Map as M

import Data.Ix (inRange)

import Util

type Assembler = String

data Value
  = Register Char
  | RegisterValue Integer

type Registers = M.Map Char Integer

type Counter = Integer

-- | the program state
data State
  = Running Counter Registers
  | Done Integer

type Instruction = State -> State

-- | a/the special register to store the number of multiplications.
counterRegister :: Char
counterRegister = 'X'

-- | read the input
input :: [Assembler]
input = inputRaw "input/Day23input.txt"

-- | execute the set instruction
set' :: Char -> Value -> State -> State
set' r (RegisterValue i) (Running pc rs) = Running (pc + 1) (M.insert r i rs)
set' r (Register ri) (Running pc rs) = Running (pc + 1) (M.insert r (M.findWithDefault 0 ri rs) rs)
set' _ _ (Done _) = error "Unknown state"

-- | execute the sub instruction
sub' :: Char -> Value -> State -> State
sub' r (RegisterValue i) (Running pc rs) = Running (pc + 1) (M.insert r ((M.findWithDefault 0 r rs) - i) rs)
sub' r (Register ri) (Running pc rs) = Running (pc + 1) (M.insert r ((M.findWithDefault 0 r rs) - (M.findWithDefault 0 ri rs)) rs)
sub' _ _ (Done _) = error "Unknown state"

-- | execute the mul instruction (and increase the mul counter)
mul' :: Char -> Value -> State -> State
mul' r (RegisterValue i) (Running pc rs) = Running (pc + 1) (M.insert counterRegister ((M.findWithDefault 0 counterRegister rs) + 1) $ M.insert r ((M.findWithDefault 0 r rs) * i) rs)
mul' r (Register ri) (Running pc rs) = Running (pc + 1) (M.insert counterRegister ((M.findWithDefault 0 counterRegister rs) + 1) $ M.insert r ((M.findWithDefault 0 r rs) * (M.findWithDefault 0 ri rs)) rs)
mul' _ _ (Done _) = error "Unknown state"

-- | execute the jnz (jump, if r is not zero) instruction
jnz' :: Char -> Value -> State -> State
jnz' r (RegisterValue offset) (Running pc rs)
  | (M.findWithDefault 0 r rs) /= 0 = Running (pc + offset) rs
  | otherwise = Running (pc + 1) rs
jnz' r (Register roffset) (Running pc rs)
  | (M.findWithDefault 0 r rs) /= 0 = Running (pc + (M.findWithDefault 0 roffset rs)) rs
  | otherwise = Running (pc + 1) rs
jnz' _ _ (Done _) = error "Unknown state"

-- | get the register from the argument
getRegister :: String -> Char
getRegister argument = argument !! 0

-- | build a value from the argument
buildValue :: String -> Value
buildValue argument
  | isRegister = Register (getRegister argument)
  | otherwise = RegisterValue (read argument)
  where
    isRegister = elem (argument !! 0) ['a'..'h']

-- | build a/the program (a/the list of instructions) from the input
instructions :: [Assembler] -> [Instruction]
instructions input' = map (instruction . tokenize) input' where
  tokenize = words
  instruction ("set":arguments) = set' (getRegister (arguments !! 0)) (buildValue (arguments !! 1))
  instruction ("sub":arguments) = sub' (getRegister (arguments !! 0)) (buildValue (arguments !! 1))
  instruction ("mul":arguments) = mul' (getRegister (arguments !! 0)) (buildValue (arguments !! 1))
  instruction ("jnz":arguments) = jnz' (getRegister (arguments !! 0)) (buildValue (arguments !! 1))
  instruction _ = error "Unknown instruction"

-- | the initial state.
initialState :: State
initialState = Running 0 M.empty

-- | run the instructions (until we are done)
runProgram :: State -> [Instruction] -> Integer
runProgram (Done exit) _ = exit
runProgram currentState@(Running pc rs) program = runProgram nextState program where
  nextState
    | inRange (0, (length program) - 1) (fromInteger pc) = (program !! (fromInteger pc)) currentState
    | otherwise = Done (M.findWithDefault 0 counterRegister rs)
