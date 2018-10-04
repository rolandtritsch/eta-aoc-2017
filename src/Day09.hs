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

type Event = Char

-- | read the input (as a stream of chars/events)
input :: [Event]
input = head $ inputRaw "input/Day09input.txt"

-- | define a simple finite state machine
type FSM state event = state -> event -> IO state

-- | all of the stats I want to collect, while processing the stream
data Stats = Stats {
  score :: Int,
  numOfChars :: Int
  } deriving (Eq, Show)

type Level = Int

-- | all of the states (according to the diagram)
data State
  = InGroup Level Stats
  | InGarbage Level Stats
  | InCanceled Level Stats
  deriving (Eq, Show)

-- | process a given event/char
processEvent :: FSM State Event
processEvent (InGroup level stats) '{' = return (InGroup (level + 1) stats)
processEvent (InGroup level (Stats score' chars)) '}' = return (InGroup (level - 1) (Stats (score' + level) chars))
processEvent (InGroup level stats) '<' = return (InGarbage level stats)
processEvent (InGroup level stats) _ = return (InGroup level stats)
processEvent (InGarbage level stats) '>' = return (InGroup level stats)
processEvent (InGarbage level stats) '!' = return (InCanceled level stats)
processEvent (InGarbage level (Stats score' chars)) _ = return (InGarbage level (Stats score' (chars + 1)))
processEvent (InCanceled level stats) _ = return (InGarbage level stats)
