{-|
Problem: <https://adventofcode.com/2017/day/14>

Solution:

General - Using the solution from Day10, we are calculating
the 128x128 bit hash grid. Note: Instead of a grid of chars
[#.] I am using a grid of booleans.

Part1 - We are counting all the trues in the hashes.

Part2 - Is a little bit more tricky. I decided to look at it
as a tree search problem. I visit every square and if it is
used I recursively visit all adjacent squares until there are
no more squares to visit (means I have now visited and collected
all squares of the region). I do this for the entire grid and
will end up with a/the list of root nodes (coordinates) for
all regions.
-}
module Day14 where

import qualified Data.Set as S

import Util

import qualified Day10.Part2 as D10P2

type Grid = [[Bool]]

-- | read the input
input :: String
input = head $ inputRaw "input/Day14input.txt"

-- | build a/the (hex) hash (for a given key/row)
buildHash :: String -> Int -> String
buildHash key row = D10P2.solve (key ++ "-" ++ (show row))

-- | convert a hex char to a/the binary (string) representation of that char
hex2bin :: Char -> String
hex2bin '0' = "0000"
hex2bin '1' = "0001"
hex2bin '2' = "0010"
hex2bin '3' = "0011"
hex2bin '4' = "0100"
hex2bin '5' = "0101"
hex2bin '6' = "0110"
hex2bin '7' = "0111"
hex2bin '8' = "1000"
hex2bin '9' = "1001"
hex2bin 'a' = "1010"
hex2bin 'b' = "1011"
hex2bin 'c' = "1100"
hex2bin 'd' = "1101"
hex2bin 'e' = "1110"
hex2bin 'f' = "1111"
hex2bin _ = error "Unknown hex char"

-- | build a/the grid (128x128; of booleans)
buildGrid :: String -> Grid
buildGrid key = map (map ((==) '1')) $ map (concatMap hex2bin) $ map (buildHash key) [0..127]

-- | is the given square used
isUsed :: Grid -> (Int, Int) -> Bool
isUsed grid (row, col) = (grid !! row) !! col

-- | given a (start) square, find all (used) adjacent squares (and make sure you do not loop)
findRegion :: Grid -> S.Set (Int, Int) -> (Int, Int) -> S.Set (Int, Int)
findRegion grid alreadySeen coordinates@(row, col)
  | S.member coordinates alreadySeen = S.empty
  | row < 0 || row > 127 = S.empty
  | col < 0 || col > 127 = S.empty
  | (not . isUsed grid) coordinates = S.empty
  | otherwise =
    S.union (findRegion grid (S.insert coordinates alreadySeen) (row + 1, col)) $
    S.union (findRegion grid (S.insert coordinates alreadySeen) (row - 1, col)) $
    S.union (findRegion grid (S.insert coordinates alreadySeen) (row, col + 1)) $
    S.union (findRegion grid (S.insert coordinates alreadySeen) (row, col - 1)) $
    S.singleton coordinates

-- | find all regions
findRegions :: Grid -> S.Set (S.Set (Int, Int))
findRegions grid = S.filter (not . S.null) $ foldl findRegions' S.empty coordinates where
  findRegions' regionsSoFar currentSquare = S.insert (findRegion grid (S.unions $ S.toList regionsSoFar) currentSquare) regionsSoFar
  coordinates = [(row, col) | row <- [0..127], col <- [0..127]]
