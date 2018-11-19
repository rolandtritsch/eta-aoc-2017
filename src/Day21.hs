{-|
Problem: <https://adventofcode.com/2017/day/21>

Solution:

General - This was a tricky one. First, you have to get the transformations
right. Means you read all of the rules from the input, but then you have to
*add* rules for all of the <https://en.wikipedia.org/wiki/Dihedral_group_of_order_8 transformations>
(by flipping and rotating the input pattern).

We then need to implement a/the divide-enhance-join functions and call them
recursively for N iterations.

Part1 - Run divide-enhance-join for 5 iterations.

Part2 - Run divide-enhance-join for 18 iterations.
-}
module Day21 where

import Data.Maybe (fromJust)
import Data.List (transpose, reverse, intersperse, replicate, find)
import Data.List.Split (splitOn, chunksOf)

import Util

type Grid = [String]

data Rule = Rule Grid Grid deriving (Show, Eq)

-- | the start grid.
startGrid :: Grid
startGrid = [
  ".#.",
  "..#",
  "###"
  ]

-- | from string to grid.
toGrid :: String -> Grid
toGrid s = splitOn "/" s

-- from grid to string.
fromGrid :: Grid -> String
fromGrid g = (concat . intersperse "/") g

-- | rotate a grid (clockwise).
rotateClockwise :: Grid -> Grid
rotateClockwise g = (transpose . reverse) g

-- | flip a grid (horizontal).
flipHorizontal :: Grid -> Grid
flipHorizontal g = reverse g

-- | read the input (../.. => ###/.##/#..).
input :: [Rule]
input = concatMap addTransformations $ map ruleBuilder $ inputRaw "input/Day21input.txt" where
  ruleBuilder line = Rule from to where
    tokens = splitOn " => " line
    from = toGrid $ tokens !! 0
    to = toGrid $ tokens !! 1
  addTransformations (Rule from to)
    = [Rule from to]
    ++ [Rule (flipHorizontal from) to]
    ++ [Rule (rotateOnce from) to]
    ++ [Rule (rotateTwice from) to]
    ++ [Rule (rotateThrice from) to]
    ++ [Rule (rotateOnce $ flipHorizontal from) to]
    ++ [Rule (rotateTwice $ flipHorizontal from) to]
    ++ [Rule (rotateThrice $ flipHorizontal from) to]
    where
      rotateOnce = rotateClockwise
      rotateTwice = rotateClockwise . rotateClockwise
      rotateThrice = rotateClockwise . rotateClockwise . rotateClockwise

-- | copy an area from one grid into a new grid.
copyGrid :: Int -> Int -> Int -> Grid -> Grid
copyGrid row col size grid = newGrid (replicate size (replicate size 'X')) where
  rowRangeFrom = [row..(row + size - 1)]
  colRangeFrom = [col..(col + size - 1)]
  rowRangeTo = [0..(size - 1)]
  colRangeTo = [0..(size - 1)]
  coordinatesFrom = [(r, c) | r <- rowRangeFrom, c <- colRangeFrom]
  coordinatesTo = [(r, c) | r <- rowRangeTo, c <- colRangeTo]
  get (r, c) g = (g !! r) !! c
  set (r, c) v g = headRows ++ [newRow] ++ tailRows where
    headRows = take r g
    tailRows = drop (r + 1) g
    oldRow = g !! r
    newRow = headCols ++ [v] ++ tailCols where
      headCols = take c oldRow
      tailCols = drop (c + 1) oldRow
  coordinatesFromTo = zip coordinatesFrom coordinatesTo
  newGrid ng = foldl fromTo ng coordinatesFromTo where
    fromTo cg (f, t) = set t (get f grid) cg

-- | "divide" the given grid (as described in the problem statement).
divide :: Grid -> [Grid]
divide grid = grids where
  size = if (mod (length grid) 2) == 0 then 2 else 3
  grids = [copyGrid row col size grid | row <- [0,size..(length grid) - 1], col <- [0,size..(length grid) - 1]]

-- | "enhance" the given list of grids with the given list of rules.
enhance :: [Rule] -> [Grid] -> [Grid]
enhance rs gs = map (apply rs) gs where
  apply rs' g = newGrid where
    newGrid = getGrid $ fromJust $ find (findRule g) rs' where
      getGrid (Rule _ g') = g'
      findRule g' (Rule f _) = g' == f

-- | "join" a list of grids together into one grid.
join :: [Grid] -> Grid
join gs = newGrid where
  numberOfRows = length $ gs !! 0
  newGrid = concatMap buildLines groupOfLines where
    buildLines gs' = map buildLine [0..numberOfRows - 1] where
      buildLine r = concatMap (\g -> g !! r) gs'
  isqrt i = round . sqrt $ (fromIntegral i :: Float)
  groupOfLines = chunksOf (isqrt $ length gs) gs

-- | run a/the simulation for a given number of iterations.
runSimulation :: [Rule] -> Integer -> Grid -> Grid
runSimulation _ 0 g = g
runSimulation rs i g = runSimulation rs (i - 1) (join (enhance rs (divide g)))

-- | count the pixels in a grid.
countPixel :: Grid -> Int
countPixel g = (length . filter ((==) '#') . fromGrid) g
