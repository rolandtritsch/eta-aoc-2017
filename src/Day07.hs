{-|
Problem: <https://adventofcode.com/2017/day/7>

Solution:

General - This is a tree searching problem.

Part1 - The root is the only node with no parent, means
it is never referenced as a child, means we can find it
by doing the diff between all nodes and all children.

Part2 - Find the root. Go through the tree (top-down) and
find the (bad) node, where the tree unbalanced (for the
first time). Find the wrong weight (the one that is
different to the other ones) and calc you to correct it.
-}
module Day07 where

import Data.List (isInfixOf)
import Data.List ((\\))
import Data.List.Split (splitOneOf)

import Util (inputRaw)

data ParseElement =
  ParseNode {
    name :: String,
    weight :: Int,
    children :: [String]
  } |
  ParseLeaf {
    name :: String,
    weight :: Int
  } deriving (Eq, Show)

-- | read the input
input :: [ParseElement]
input = map parser $ inputRaw "input/Day07input.txt" where
  parser line
    | isNode line = parseNode line
    | otherwise = parseLeaf line
    where
      isNode line = isInfixOf "->" line
      parseNode line = ParseNode (tokens !! 0) (read $ tokens !! 1) (drop 2 tokens) where
        -- kozpul (59) -> shavjjt, anujsv, tnzvo
        tokens = filter ((/=) "") $ splitOneOf "(),-> " line
      parseLeaf line = ParseLeaf (tokens !! 0) (read $ tokens !! 1) where
        -- occxa (60)
        tokens = filter ((/=) "") $ splitOneOf "() " line

-- | find the root element
findRoot :: [ParseElement] -> String
findRoot tree = head (allNames \\ allChildNames) where
  allNames = map name tree
  allChildNames = concat $ map getCs tree where
    getCs (ParseNode _ _ cs) = cs
    getCs (ParseLeaf _ _) = []
