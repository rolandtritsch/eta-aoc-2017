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

import Data.List (isInfixOf, (\\), find, group, sort)
import Data.List.Split (splitOneOf)
import Data.Maybe (fromJust)
import Data.Tree

import qualified Data.Map as M
import qualified Data.Tree as T

import Util (inputRaw)

-- | need that map to build the Tree
type NodeName = String
type NodeStruct = (Int, [NodeName])
type NodeMap = M.Map NodeName NodeStruct

-- | read the input
input :: NodeMap
input = M.fromList $ map parser $ inputRaw "input/Day07input.txt" where
  parser line
    | isNode line = parseNode line
    | otherwise = parseLeaf line where
      isNode line' = isInfixOf "->" line'
      parseNode line' = ((tokens !! 0), ((read $ tokens !! 1), (drop 2 tokens))) where
        -- kozpul (59) -> shavjjt, anujsv, tnzvo
        tokens = filter ((/=) "") $ splitOneOf "(),-> " line'
      parseLeaf line' = ((tokens !! 0), ((read $ tokens !! 1), [])) where
        -- occxa (60)
        tokens = filter ((/=) "") $ splitOneOf "() " line'

-- | find the root element
findRoot :: NodeMap -> NodeName
findRoot allNodes = head $ allNames \\ allChildNames where
  allNames = M.keys allNodes
  allChildNames = concatMap snd $ M.elems allNodes

-- | build a/the tree. Use the node map and a/the root name. Return the root element
build :: NodeMap -> NodeName -> Tree Int
build allNodes root = unfoldTree buildNode root where
  buildNode name = fromJust $ M.lookup name allNodes

-- | draw a/the tree. Just for fun
drawWeightedTree :: NodeMap -> String
drawWeightedTree nodes = drawTree $ fmap show $ build nodes $ findRoot nodes

-- | calc the weight of a given element (by suming up the weight of the subtree)
calcWeight :: Tree Int -> Int
calcWeight tree = sum $ T.flatten tree

-- | check, if the (sub)tree is balanced (if all children have the same weight)
isBalanced :: Tree Int -> Bool
isBalanced tree = all (\c -> (calcWeight c) == checkWeight) (subForest tree) where
  checkWeight = calcWeight $ head (subForest tree)

-- | find a/the bad node (by finding the node that is not balanced, but all of its
-- children are balanced; otherwise I have to go down more level)
findBadNode :: Tree Int -> Tree Int
findBadNode tree
  | not (isBalanced tree) && all isBalanced (subForest tree) = tree
  | otherwise = findBadNode $ fromJust $ find (\c -> not (isBalanced c)) (subForest tree)

-- | for a given (bad) node, return the correct weight
correctWeight :: Tree Int -> Int
correctWeight badNode = (rootLabel bad) - (badWeight - goodWeight) where
  histo = group $ sort $ map calcWeight (subForest badNode)
  goodWeight = head $ fromJust $ find (\ws -> (length ws) > 1) histo
  badWeight = head $ fromJust $ find (\ws -> (length ws) == 1) histo
  bad = fromJust $ find (\c -> (calcWeight c) == badWeight) (subForest badNode)
