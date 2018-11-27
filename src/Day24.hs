{-|
Problem: <https://adventofcode.com/2017/day/24>

Solution:

General - Kind of simple. First you need to [[findZero]].
Then you need to [[findPath]] for one component. And then
you need to [[findPaths]] for all components. You basically
build a tree of all possible paths/solutions. And on that
you can then look for the strongest and/or for the longest
path and/or for ...

Part1 - Just look for the strongest path (but that might
not be the longest path).

Part2 - Now look for the longest path (and if you find
more than one longest one, pick the strongest of the
long ones).
-}
module Day24 where

import Prelude hiding (flip)

import Data.List.Split (splitOn)
import Data.List (filter, delete)

import Data.Tree

--import Debug.Trace (trace)

import Util

type Port = Integer

type Strength = Integer

data Component = Component {
  leftPort ::Port,
  rightPort :: Port,
  strength :: Strength
} deriving (Show, Eq)

type BridgeStrength = [Strength]

type Bridges = Tree Strength

-- | read the input (and turn it into a list of components).
input :: [Component]
input = map processLine $ inputRaw "input/Day24input.txt" where
  processLine l = Component left right (left + right) where
    tokens = splitOn "/" l
    left = read $ tokens !! 0
    right = read $ tokens !! 1

-- | build a/the tree to represent all bridges.
-- This is where the magic happens.
-- From the list of components we are building a tree.
-- The tree shows which components can be connected.
-- Every node in the tree shows/carries the strengths of
-- the component that was used to build the node.
-- Means ... every path to a leaf node is a valid bridge
-- and if you sum up the strength of the nodes on that path
-- you will get the strength of the bridge or ... if you count
-- the number of nodes on the path you will get the length of
-- the bridge (but more on this later; take a look are <bridges>).
-- To build the tree we take a//the list of remaining//available
-- components and the component we need to find a connection for.
-- Finding a/the next component is tricky (because the components
-- can be connected in any direction (with the left port or the
-- right port)). We solve this problem by flipping around the
-- component (if we discover that the next component is the
-- wrong way around).
-- This way we can *just/always* connect the right port of the
-- current component with the left port of the next component.
-- One other slight complication are the components where the
-- left port and the right port are the same. We can *just* ignore
-- the fact that connecting to the leftPort or flipping it around
-- and connecting to the right port will give us the some subtree
-- or we add extra logic to make sure we recurse into that subtree
-- only once (and that is what we are doing, because eliminating
-- the redundant/duplicated subtrees gives us much better performance,
-- when we build the bridges (see <bridges>).
-- If we do not find a/the next component then we know, that we
-- have reached a leaf node (the end of a bridge). Note: This
-- also covers the case that the list of remaining/available
-- components was empty in the first place.
build :: [Component] -> Component -> Bridges
build cs currentComponent
  | isLeaf = Node (strength currentComponent) []
  | otherwise = Node (strength currentComponent) children
  where
    isLeaf = null $ nextComponents
    nextComponents = nextLeftComponents ++ nextRightComponents ++ nextEqualComponents
    children = nextLeftChildren ++ nextRightChildren ++ nextEqualChildren
    nextLeftComponents = filter match cs where
      match c
        = rightPort currentComponent == leftPort c
        && rightPort c /= leftPort c
    nextLeftChildren = map go nextLeftComponents where
      go nc = build (delete nc cs) nc
    nextRightComponents = filter match cs where
      match c
        = rightPort currentComponent == rightPort c
        && rightPort c /= leftPort c
    nextRightChildren = map go nextRightComponents where
      go nc = build (delete nc cs) (flip nc) where
        flip (Component l r s) = Component r l s
    nextEqualComponents = filter match cs where
      match c
        = rightPort currentComponent == leftPort c
        && rightPort c == leftPort c
    nextEqualChildren = map go nextEqualComponents where
      go nc = build (delete nc cs) nc

-- | the root of the tree.
root :: [Component] -> Bridges
root cs = build cs (Component 0 0 0)

-- | get all possible bridges (creating/returning lists of strength).
bridges :: Bridges -> [BridgeStrength]
bridges t = foldTree go t where
  go :: Integer -> [[BridgeStrength]] -> [BridgeStrength]
  go s cbs
    | isLeaf = [[s]]
    | otherwise = map ((++) [s]) childrenBridgeStrength
    where
      isLeaf = null cbs
      childrenBridgeStrength = concat cbs
