{-|
Problem: <https://adventofcode.com/2017/day/16>

Solution:

General - Kind of simple. Take a program and a move and execute
the move on the program. Take all moves and execute all of them
one after the other (executeMoves). Then (for Part2) execute all
moves on a/the program 1000000000 times.

Part1 - execute the moves (once).

Part2 - execute the moves 1000000000 times (execute the dance).
The big trick here is to realize that there is a loop in the
dance and that the dance is repeating itself after N iterations,
means you can ignore the first M times the dance is executed and
need todo the remainder to find the final position.
-}
module Day16 where

import Data.List.Split (splitOn)
import Data.List (elemIndex)
import Data.Maybe (fromJust)

import Util

-- | read the input
input :: [String]
input = splitOn "," $  head $ inputRaw "input/Day16input.txt"

-- | the inital program
initialProgram :: String
initialProgram = ['a'..'p']

-- | execute the spin move (counter clockwise)
spin :: Int -> String -> String
spin n program = tail' ++ head' where
  (head', tail') = splitAt (length program - n) program

-- | replace the char at position n (in program p) with c
replace :: Int -> Char -> String -> String
replace n c p = head' ++ [c] ++ (tail tail') where
  (head', tail') = splitAt n p

-- | execute the exchange move
exchange :: Int -> Int -> String -> String
exchange from to program = (replace from toChar . replace to fromChar) program where
  fromChar = program !! from
  toChar = program !! to

-- | execute the partner move
partner :: Char -> Char -> String -> String
partner fromChar toChar program = (replace from toChar . replace to fromChar) program where
  from = fromJust (elemIndex fromChar program)
  to = fromJust (elemIndex toChar program)

-- | create the moves
moves :: [String] -> [String -> String]
moves input' = map move input' where
  move ('s':argument) = spin n where
    n = read argument
  move ('x':argument) = exchange from to where
    tokens = splitOn "/" argument
    from = read (tokens !! 0)
    to = read (tokens !! 1)
  move ('p':argument) = partner fromChar toChar where
    fromChar = argument !! 0
    toChar = argument !! 2
  move _ = error "Unknown move"

-- | solve (with initial program)
runProgram :: [String] -> String -> String
runProgram programs initial = foldl apply initial (moves programs) where
  apply program' move = move program'
