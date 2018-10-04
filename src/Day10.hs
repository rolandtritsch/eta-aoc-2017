{-|
Problem: <https://adventofcode.com/2017/day/10>

Solution:

General - Nothing special here. Just very careful reading
of the problem statement and the requirements that come
with it.

Part1 - Implement the knot.

Part2 - Implement the sparse/dense hash.
-}
module Day10 where

import Data.Text (split, pack, unpack)
import Data.Text.Read (decimal)
import Data.Either (rights)

import Data.Char (ord)
import Data.List.Split (chunksOf)
import Data.Bits (xor)
import Data.HexString (fromBinary, toText)

import Util

type Length = Int
type Hash = [Int]
type Position = Int
type Size = Int

data State = State {
  hash :: Hash,
  position :: Position,
  skip :: Size
  } deriving (Eq, Show)

-- | read the input
input :: String
input = head $ inputRaw "input/Day10input.txt"

-- | convert the input to an array of lengths
input2Lengths :: String -> [Length]
input2Lengths input' = map fst $ rights $ map decimal $ split ((==) ',') $ pack input'

-- | reverse the segment defined by start and length
reverseSegment :: Hash -> Position -> Length -> Hash
reverseSegment hash' start' length' = shiftRight start' $ reverse' length' $ shiftLeft start' hash' where
  shiftLeft 0 hash'' = hash''
  shiftLeft 1 (head':tail') = tail' ++ [head']
  shiftLeft times hash'' = shiftLeft (times - 1) (shiftLeft 1 hash'')
  shiftRight times hash'' = shiftLeft ((length hash'') - times) hash''
  reverse' length'' hash'' = (reverse $ take length'' hash'') ++ (drop length'' hash'')

-- | how to pinch a hash
pinch :: State -> Length -> State
pinch (State hash' position' skip') length' = State nextHash nextPosition nextSkip where
  nextHash = reverseSegment hash' position' length'
  nextPosition = mod (position' + length' + skip') (length hash')
  nextSkip = skip' + 1

-- | the (initial) hash state
seed :: State
seed = State [0..255] 0 0

-- | knot a hash by pinching it with all lengths
knot :: [Length] -> State -> State
knot lengths initial = foldl pinch initial lengths

-- | encode a/the input string
encode :: String -> [Length]
encode input' = (map ord input') ++ suffix where
  suffix = [17, 31, 73, 47, 23]

-- | number of rounds to do on tying the knot
rounds :: Int
rounds = 64

-- | tie the knot n times/rounds (always using the same lengths)
knots :: [Length] -> Int -> State
knots _ 0 = seed
knots lengths rounds' = knot lengths (knots lengths (rounds' - 1))

-- | reduce a sparse hash into a dense hash
sparse2dense :: Hash -> Hash
sparse2dense hash' = map xorIt blocks where
  blocks = chunksOf 16 hash'
  xorIt = foldl xor 0

-- | convert a (dense) hash to a (hex) string
dense2hex :: Hash -> String
dense2hex hash' = concatMap int2hex hash' where
  int2hex i = drop 14 $ unpack $ toText $ fromBinary i
