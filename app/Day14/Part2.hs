module Day14.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import qualified Data.Set as S

import Day14

-- | solve the puzzle
solve :: String -> Int
solve key = (S.size . findRegions . buildGrid) key

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day14: Part2: regions -> (%d, %f)\n" result time
