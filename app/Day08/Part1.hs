module Day08.Part1 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import qualified Data.Map as M

import Day08

-- | solve the puzzle
solve :: [Instruction] -> Int
solve instructions = maximum $ M.elems $ foldl exec M.empty instructions

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day08: Part1: maxregister -> (%d, %f)\n" result time
