module Day08.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import qualified Data.Map as M

import Day08

-- | solve the puzzle
solve :: [Instruction] -> Int
solve instructions = fst $ foldl findMax (0, M.empty) instructions where
  findMax (m, rs) i = (max m (maximum $ M.elems $ rs'), rs') where
    rs' = exec rs i

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day08: Part2: maxregisters -> (%f, %d)\n" time result
