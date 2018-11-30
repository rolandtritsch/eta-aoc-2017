{-# LANGUAGE ScopedTypeVariables #-}
module Day24.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Data.List (maximumBy)

import Day24

-- | solve the puzzle.
solve :: [Component] -> Integer
solve cs = snd $ longestStrongest where
  bs = bridges $ root cs
  ps = map (\b -> (length b, sum b)) bs
  longestStrongest = maximumBy p ps where
    p (l, s) (l', s')
      | l > l' = GT
      | l < l' = LT
      | l == l' && s > s' = GT
      | l == l' && s < s' = LT
      | l == l' && s == s' = EQ
      | otherwise = error "Unknown pattern"

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day24: Part2: longest -> (%f, %d)\n" time result
