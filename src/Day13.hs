{-|
Problem: <https://adventofcode.com/2017/day/13>

Solution:

General - First implementation was a simulation. That turned out to be too slow
for Part2. Second implementation is calculating the solution/collisions. The main
idea is that the layers correspond to the number of picosecs, after 0 picosecs we
are on layer 0, after 1 on layer 1, and so on. With that it is easy to calculate,
if the packet gets dedected at/on that layer in the firewall ((number of picosecs)
modolo (the range of the scanner)).

Part1 - Fold through the layers of the firewall and sum up the security score of
every layer, where the threat gets detected.

Part2 - Add an offset/delay to the depth of the layers of the firewall. Increase
the delay until we can pass through the firewall undetected.
-}
module Day13 where

import qualified Data.Map.Strict as M
import Data.List.Split (splitOneOf)
import Data.List (sort)

import Util

type Layers = M.Map Int Int
type Firewall = [(Int, Int)]

-- | read the input
input :: Layers
input = M.fromList $ map line $ inputRaw "input/Day13input.txt" where
  line l = (depth, range) where
    tokens = map read $ filter (not . null) $ splitOneOf " :" l
    depth = head tokens
    range = last tokens

-- | build a/the firewall (with a delay (adding extra layers at the front of the
-- firewall) to solve part 2)
buildFirewall :: Layers -> Int -> Firewall
buildFirewall layers delay = sort $ map buildLayer [0..(fst $ (M.findMax layers)) + delay] where
  buildLayer depth = (depth, range) where
    range = M.findWithDefault 0 (depth - delay) layers

-- | find out, if we have detected a thread.
-- Here we go: If the layer on the current depth has no range
-- the packet can never be caught (the layer is not able to
-- catch the packet, right). And if the range of the layer is
-- 1 the packet will always be caught. Otherwise we just do the
-- modolo operation, but ... we need to take into consideration
-- that the scanner is moving down and then up again (this is why
-- it is "*2".
threadDetected :: Int -> Int -> Bool
threadDetected _ 0 = True
threadDetected _ 1 = False
threadDetected depth range = depth `mod` ((range - 1) * 2) == 0

-- | calculate the security score
calcSecScore :: Firewall -> Int
calcSecScore fw = foldl calcLayer 0 fw where
  calcLayer secScore (depth, range)
    | threadDetected depth range = secScore + depth * range
    | otherwise = secScore
