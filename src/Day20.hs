{-|
Problem: <https://adventofcode.com/2017/day/20>

Solution:

General - A Particle got a Position and a Velocity
and an Acceleration. With every *tick* the Particle will get
a new Position. Run a/the simulation for a while (defaultDepth).

Part1 - Check on/in the resulting list of particles, where the
minimum is and find the closest particle to the center.

Part2 - Run a/the simulation again, but filter out all collisions.
And then *just* take the size of the resulting list.
-}
module Day20 where

import Data.List.Split (splitOneOf)

import Util

data Position = Position Integer Integer Integer deriving (Show, Eq, Ord)

data Velocity = Velocity Integer Integer Integer deriving (Show, Eq)

data Acceleration = Acceleration Integer Integer Integer deriving (Show, Eq)

data Particle = Particle Position Velocity Acceleration deriving (Show)

instance Eq Particle where
  (Particle p _ _) == (Particle p' _ _) = p == p'

instance Ord Particle where
  compare (Particle p _ _) (Particle p' _ _) = compare p p'

-- | calculate new position (for a given position), using a given velocity.
addVel2Pos :: Velocity -> Position -> Position
addVel2Pos (Velocity vx vy vz) (Position px py pz) = Position (px + vx) (py + vy) (pz + vz)

-- | calculate the distance for a fiven position (from (0, 0, 0)).
distanceFromOrigin :: Position -> Integer
distanceFromOrigin (Position x y z) = (abs x) + (abs y) + (abs z)

-- | calculate new velocity, using a given acceleration.
addAcc2Vel :: Acceleration -> Velocity -> Velocity
addAcc2Vel (Acceleration ax ay az) (Velocity vx vy vz) = Velocity (vx + ax) (vy + ay) (vz + az)

-- | move a given particle.
tick :: Particle -> Particle
tick (Particle pos vel acc) = Particle newPos newVel newAcc where
  newAcc = acc
  newVel = addAcc2Vel newAcc vel
  newPos = addVel2Pos newVel pos

-- | read the input (p=<1199,-2918,1457>, v=<-13,115,-8>, a=<-7,8,-10>)
input :: [Particle]
input = (map tokenize . inputRaw) "input/Day20input.txt" where
  tokenize line = Particle pos vel acc where
    tokens = splitOneOf "<>," line
    pos = Position (read $ tokens !! 1) (read $ tokens !! 2) (read $ tokens !! 3)
    vel = Velocity (read $ tokens !! 6) (read $ tokens !! 7) (read $ tokens !! 8)
    acc = Acceleration (read $ tokens !! 11) (read $ tokens !! 12) (read $ tokens !! 13)
