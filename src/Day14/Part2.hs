-- Part2.hs
module Day14.Part2 where

import qualified Data.Set as S

import Day14

-- | solve the puzzle
solve :: String -> Int
solve key = (S.size . findRegions . buildGrid) key
