{-|
Problem: [[https://adventofcode.com/2017/day/1]]

Solution:

General - To avoid to have to deal with the "wrap-around" we
we are *just* doubling the size of the input. With that we can
build pairs/tuples of values (i, i + offset), find the pairs where
both numbers are the same and sum up the values of the pairs.

Part 1 - Run the algorithm with an offset of 1.

Part 2 - Run the algorithm with an offset of half the length of the input string.
-}
module Day01 where

import Data.Char (digitToInt)
import Util (inputRaw)

-- | read the input file
input :: String
input = head $ inputRaw "input/Day01input.txt"

-- |`captcha` returns the captcha for the given number.
--
-- Algorithm goes like this ...
--
-- * turn the string into a list of ints
-- * append the first element of the list to the end of the list
-- * move a sliding window of two elements over the list
-- * add up all windows where the elements are the same (recursively)
captcha :: String -> Int
captcha s = go (prep s) where
  prep s' = digits ++ [head digits] where
    digits = map digitToInt s'
  go [] = error "Impossible match"
  go (_ : []) = 0
  go (d : ds)
    | d == (head ds) = d + go ds
    | otherwise = go ds

-- |`captcha'` returns the captcha for the given number.
--
-- Algorithm goes like this ...
--
-- * turn the string into a list of ints
-- * duplicate the list (to allow to "wrap" without difficult arithmetics)
-- * go through the list (adding up list(n), if list(n) == list(n + offset))
captcha' :: String -> Int
captcha' s = go (prep s) (div (length s) 2) (length s - 1) where
  prep s' = digits ++ digits where
    digits = map digitToInt s'
  go _ _ (- 1) = 0
  go list offset n
    | list !! n == list !! (n + offset) = (list !! n) + go list offset (n - 1)
    | otherwise = go list offset (n - 1)
