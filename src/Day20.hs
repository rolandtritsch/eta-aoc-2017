{-|
Problem: <https://adventofcode.com/2017/day/20>

Solution:

General - A Particle got a Position and a Velocity
and an Acceleration. With every *tick* the Particle will get
a new Position. Run a/the simulation for a while (defaultDepth).

Part1 - Check on/in the resulting list of particles, where the
minimum is and find the closest particle to the center.

Part2 - Run a/the simulation again, but filter out all collisions.
And then *just* take teh size of the resulting list.
-}
module Day20 where

import Util

-- | read the input.
input :: [String]
input = inputRaw "input/Day20input.txt"
