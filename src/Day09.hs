{-|
Problem: <https://adventofcode.com/2017/day/9>

Solution:

General - My first implementation was based on a recursive processing
of the input stream. Hard to read. Hard to understand. Hard to extend/
maintain. And hard to run (needs a special -Xss setting (more/large
stack).

This (refactored) implementation is using a state machine. The states
are OutOfGroup, InGroup, InGarbage, InCanceled. See also
<https://www.dropbox.com/s/pwogl9jhc8x7rqe/2018-02-213.01.24.jpg?dl=0 pic>.
While I am running the state machine I am collecting stats that will allow
me (at the end) to answer (the given) questions about the input stream.

Part1 - Trivial. Collect and show the right stats.
Part2 - Trivial. Collect and show the right stats.
-}
module Day09 where

import Util

-- | read the input
input :: String
input = head $ inputRaw "input/Day09input.txt"

-- | all of the states (according to the diagram)
type Level = Int
type Score = Int
type NumOfChars = Int
data State
  = InGroup Level Score NumOfChars
  | InGarbage Level Score NumOfChars
  | InCanceled Level Score NumOfChars
  deriving (Eq, Show)

-- | transition to the next state (according to the diagram)
transition :: State -> Char -> State
transition (InGroup level score chars) '{' = InGroup (level + 1) score chars
transition (InGroup level score chars) '}' = InGroup (level - 1) (score + level) chars
transition (InGroup level score chars) '<' = InGarbage level score chars
transition (InGroup level score chars) _ = InGroup level score chars
transition (InGarbage level score chars) '>' = InGroup level score chars
transition (InGarbage level score chars) '!' = InCanceled level score chars
transition (InGarbage level score chars) _ = InGarbage level score (chars + 1)
transition (InCanceled level score chars) _ = InGarbage level score chars
