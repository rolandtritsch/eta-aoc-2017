{-|
Problem: <https://adventofcode.com/2017/day/5>

Solution:

General - Walk through the stack and update the stack with the offset()
function until the stack counter is/runs out of bounds (which indicates
that the "program" has exited.

Note: The given program will exit at the higher end of the stack, but
for completeness we are also checking for the lower bound.

Part1 - Trivial. Just increase the stack counter by 1.

Part2 - Increase the stack counter as described in the problem statement.
-}
module Day05 where

import qualified Data.Map as M

import Util (inputRaw)

type Stack = M.Map Int Int

-- | read the input
input :: Stack
input = M.fromList $ zip [0..] $ map read $ inputRaw "input/Day05input.txt"

-- ! update the stack (with a new offset)
update :: Int -> (Int -> Int) -> Stack -> Stack
update counter offset stack = M.insert counter (offset (stack M.! counter)) stack

-- | execute jumps until you outside the stack
jump :: Stack -> Int -> (Int -> Int) -> Int -> Int
jump stack counter offset step
  | counter < 0 || counter >= M.size stack = step
  | otherwise = jump nextStack nextCounter offset (step + 1) where
      nextStack = update counter offset stack
      nextCounter = counter + (stack M.! counter)
