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

import qualified Data.Map.Strict as M

import Util

type Assembler = String

data Value
  = Register Char
  | RegisterValue Int

type Registers = M.Map Char Int

type Counter = Int

-- | the program state
data State
  = Running Counter Registers
  | Done Int

type Instruction = State -> State

-- | a/the special register to store the last sound played
soundRegister :: Char
soundRegister = 'X'

-- | read the input
input :: [Assembler]
input = inputRaw "input/Day18input.txt"

-- | excute the snd (send) instruction
snd' :: Char -> State -> State
snd' r (Running pc rs) = Running (pc + 1) (M.insert soundRegister (M.findWithDefault 0 r rs) rs)
snd' _ (Done _) = error "Unknown state"

-- | execute the set instruction
set' :: Char -> Value -> State -> State
set' r (RegisterValue i) (Running pc rs) = Running (pc + 1) (M.insert r i rs)
set' r (Register ri) (Running pc rs) = Running (pc + 1) (M.insert r (M.findWithDefault 0 ri rs) rs)
set' _ _ (Done _) = error "Unknown state"

-- | execute the add instruction
add' :: Char -> Value -> State -> State
add' r (RegisterValue i) (Running pc rs) = Running (pc + 1) (M.insert r ((M.findWithDefault 0 r rs) + i) rs)
add' r (Register ri) (Running pc rs) = Running (pc + 1) (M.insert r ((M.findWithDefault 0 r rs) + (M.findWithDefault 0 ri rs)) rs)
add' _ _ (Done _) = error "Unknown state"

-- | execute the mul instruction
mul' :: Char -> Value -> State -> State
mul' r (RegisterValue i) (Running pc rs) = Running (pc + 1) (M.insert r ((M.findWithDefault 0 r rs) * i) rs)
mul' r (Register ri) (Running pc rs) = Running (pc + 1) (M.insert r ((M.findWithDefault 0 r rs) * (M.findWithDefault 0 ri rs)) rs)
mul' _ _ (Done _) = error "Unknown state"

-- | execute the mod instruction
mod' :: Char -> Value -> State -> State
mod' r (RegisterValue i) (Running pc rs) = Running (pc + 1) (M.insert r (mod (M.findWithDefault 0 r rs) i) rs)
mod' r (Register ri) (Running pc rs) = Running (pc + 1) (M.insert r (mod (M.findWithDefault 0 r rs) (M.findWithDefault 0 ri rs)) rs)
mod' _ _ (Done _) = error "Unknown state"

-- | execute the rcv (receive) instruction
rcv' :: Char -> State -> State
rcv' r (Running pc rs)
  | (M.findWithDefault 0 r rs) /= 0 = Done ((M.!) rs soundRegister)
  | otherwise = Running (pc + 1) rs
rcv' _ (Done _) = error "Unknown state"

-- | execute the jgz (jump, if greater than zero) instruction
jgz' :: Char -> Value -> State -> State
jgz' r (RegisterValue offset) (Running pc rs)
  | (M.findWithDefault 0 r rs) > 0 = Running (pc + offset) rs
  | otherwise = Running (pc + 1) rs
jgz' r (Register roffset) (Running pc rs)
  | (M.findWithDefault 0 r rs) > 0 = Running (pc + (M.findWithDefault 0 roffset rs)) rs
  | otherwise = Running (pc + 1) rs
jgz' _ _ (Done _) = error "Unknown state"

-- | check, if the given argument is a register
isRegister :: String -> Bool
isRegister argument = elem (argument !! 0) ['a'..'z']

-- | get the register from the argument
getRegister :: String -> Char
getRegister argument = argument !! 0

-- | build a value from the argument
buildValue :: String -> Value
buildValue argument
  | isRegister argument = Register (getRegister argument)
  | otherwise = RegisterValue (read argument)

-- | build a/the program (a/the list of instructions) from the input
instructions :: [Assembler] -> [Instruction]
instructions input' = map (instruction . words) input' where
  instruction ("snd":arguments) = snd' (getRegister (arguments !! 0))
  instruction ("set":arguments) = set' (getRegister (arguments !! 0)) (buildValue (arguments !! 1))
  instruction ("add":arguments) = add' (getRegister (arguments !! 0)) (buildValue (arguments !! 1))
  instruction ("mul":arguments) = mul' (getRegister (arguments !! 0)) (buildValue (arguments !! 1))
  instruction ("mod":arguments) = mod' (getRegister (arguments !! 0)) (buildValue (arguments !! 1))
  instruction ("rcv":arguments) = rcv' (getRegister (arguments !! 0))
  instruction ("jgz":arguments) = jgz' (getRegister (arguments !! 0)) (buildValue (arguments !! 1))
  instruction _ = error "Unknown instruction"

 -- | run the instructions (until we are done)
run :: State -> [Instruction] -> Int
run (Done exit) _ = exit
run currentState@(Running pc  _) program = run nextState program where
  nextState = (program !! pc) currentState
