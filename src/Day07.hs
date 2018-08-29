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

import Util (inputRaw)

-- | the parsing tree (not linked; just strings)
data ParseElement =
  ParseNode {
    pname :: String,
    pweight :: Int,
    pchildren :: [String]
  } |
  ParseLeaf {
    pname :: String,
    pweight :: Int
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
  allNames = map pname tree
  allChildNames = concat $ map getCs tree where
    getCs (ParseNode _ _ pcs) = pcs
    getCs (ParseLeaf _ _) = []

-- | the element tree (linked; recursive)
data Element =
  Node {
    name :: String,
    weight :: Int,
    parent :: Element,
    children :: [Element]
  } |
  Leaf {
    name :: String,
    weight :: Int,
    parent :: Element
  } |
  Root
  deriving (Eq, Show)

-- | build a/the tree. Use the parsetree and a/the root name. Return the root element
build :: [ParseElement] -> Element -> String -> Element
build parseTree parent elementName = go findElement where
  findElement = fromJust $ find (\pe -> elementName == (pname pe)) parseTree
  go (ParseLeaf pn pw) = Leaf pn pw parent
  go (ParseNode pn pw pcs) = Node pn pw parent (map (build parseTree parent) pcs)

-- | calc the weight of a given element (by suming up the weight of the subtree)
calcWeight :: Element -> Int
calcWeight Root = error "This should not happen"
calcWeight (Leaf _ w _) = w
calcWeight (Node _ w _ cs) = w + (sum $ map calcWeight cs)

-- | check, if the (sub)tree is balanced (and it is, if all children have the same weight)
isBalanced :: Element -> Bool
isBalanced Root = error "This should not happen"
isBalanced (Leaf _ _ _) = True
isBalanced (Node _ w _ cs) = all (\c -> (calcWeight c) == checkWeight) cs where
  checkWeight = calcWeight $ head cs

-- | find a/the bad node (by finding the node that is not balanced, but all of its
-- children are balanced; otherwise I have to go down more level)
findBadNode :: Element -> Element
findBadNode Root = error "This should not happen"
findBadNode (Leaf _ _ _) = error "This should not happen"
findBadNode n@(Node _ w _ cs)
  | not (isBalanced n) && all isBalanced (children n) = n
  | otherwise = findBadNode $ fromJust $ find (\c -> not (isBalanced c)) (children n)

-- | for a given (bad) node, return the correct weight
correctWeight :: Element -> Int
correctWeight badNode = (weight bad) - ((calcWeight bad) - (calcWeight good)) where
  histo = group $ sort $ map calcWeight (children badNode)
  goodWeight = head $ fromJust $ find (\ws -> (length ws) > 1) histo
  badWeight = head $ fromJust $ find (\ws -> (length ws) == 1) histo
  good = fromJust $ find (\c -> (calcWeight c) == goodWeight) (children badNode)
  bad = fromJust $ find (\c -> (calcWeight c) == badWeight) (children badNode)
