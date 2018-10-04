{-|
Problem: <https://adventofcode.com/2017/day/6>

Solution:

General - This is a [cycle detection problem](https://en.wikipedia.org/wiki/Cycle_detection).

Part1 - Is lambda + mu.

Part2 - Is just lambda.

See also <https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare>
-}
module Day06 where

import Util (inputRaw)

type MemoryBanks = [Int]

-- | read the input
input :: MemoryBanks
input = map read $ words $ head $ inputRaw "input/Day06input.txt"

-- | return the index for the bank with the most blocks (ties are won by
-- the block with the lowest index)
mostBlocksIndex :: MemoryBanks -> Int
mostBlocksIndex mbs = fst $ head $ filter (\(_, m) -> m  == maxBlock) indexPairs where
  maxBlock = maximum mbs
  indexPairs = zip [0..] mbs

-- | update the bank on index with the value
update :: Int -> Int -> MemoryBanks -> MemoryBanks
update index value mbs = take index mbs ++ [value] ++ drop (index + 1) mbs

-- | run a cycle on the memorybanks (see problem for a description of a cycle).
cycle :: MemoryBanks -> MemoryBanks
cycle mbs = foldl redistribute (update mbi 0 mbs) [1..(maximum mbs)] where
  mbi = mostBlocksIndex mbs
  redistribute cmbs i = update n (1 + cmbs !! n) cmbs where
    n = mod (mbi + i) (length mbs)

-- | floyd (see article above)
floyd :: (MemoryBanks -> MemoryBanks) -> MemoryBanks -> (Int, Int)
floyd f mbs = (lambda', mu') where
  hare' = phase1 (f mbs) (f (f mbs)) where
    phase1 tortoise hare
      | tortoise == hare = hare
      | otherwise = phase1 (f tortoise) (f (f hare))

  (tortoise', mu') = phase2 mbs hare' 0 where
    phase2 tortoise hare mu
      | tortoise == hare = (tortoise, mu)
      | otherwise = phase2 (f tortoise) (f hare) (mu + 1)

  lambda' = phase3 tortoise' (f tortoise') 1 where
    phase3 tortoise hare lambda
      | tortoise == hare = lambda
      | otherwise = phase3 tortoise (f hare) (lambda + 1)
