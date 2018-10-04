-- Part2.hs
module Day08.Part2 where

import qualified Data.Map as M

import Day08

-- | solve the puzzle
solve :: [Instruction] -> Int
solve instructions = fst $ foldl findMax (0, M.empty) instructions where
  findMax (m, rs) i = (max m (maximum $ M.elems $ rs'), rs') where
    rs' = exec rs i
