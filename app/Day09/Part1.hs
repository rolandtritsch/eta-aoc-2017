module Day09.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Control.Monad (foldM)
import System.IO.Unsafe (unsafePerformIO)

import Day09

-- | solve the puzzle
solve :: String -> Int
solve events = getScore $ unsafePerformIO $ foldM processEvent (InGroup 0 (Stats 0 0)) events where
  getScore (InGroup 0 s) = score s
  getScore _ = error "Unexpected match"

-- | decorate the FSM with logging
withLogging :: (Show s, Show e) => FSM s e -> FSM s e
withLogging fsm s e = do
  nextState <- fsm s e
  printf "%s -> %s -> %s\n" (show s) (show e) (show nextState)
  return nextState

-- | solve the puzzle (debug version)
solve' :: String -> Int
solve' events = getScore $ unsafePerformIO $ foldM (withLogging processEvent) (InGroup 0 (Stats 0 0)) events where
  getScore (InGroup 0 s) = score s
  getScore _ = error "Unexpected match"

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day09: Part1: score -> (%d, %f)\n" result time
