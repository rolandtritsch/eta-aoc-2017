-- Day01.hs
module Day01 where

import Data.Char (digitToInt)
import Util (inputRaw)

input :: String
input = head $ inputRaw "input/Day01input.txt"

-- |`captcha` returns the captcha for the given number.
-- Algorithm goes like this ...
-- * turn the string into a list of ints
-- * append the first element of the list to the end of the list
-- * move a sliding window of two elements over the list
-- * add up all windows where the elements are the same (recursively)
captcha :: String -> Int
captcha s = go (prep s) where
  prep s = digits ++ [head digits] where
    digits = map digitToInt s
  go (d : []) = 0
  go (d : ds)
    | d == (head ds) = d + go ds
    | otherwise = go ds

-- |`captcha'` returns the captcha for the given number.
-- Algorithm goes like this ...
-- * turn the string into a list of ints
-- * duplicate the list (to allow to "wrap" without difficult arithmetics
-- * go through the list (adding up list(n), if list(n) == list(n + offset))
captcha' :: String -> Int
captcha' s = go (prep s) (div (length s) 2) (length s - 1) where
  prep s = digits ++ digits where
    digits = map digitToInt s
  go _ _ (- 1) = 0
  go list offset n
    | list !! n == list !! (n + offset) = (list !! n) + go list offset (n - 1)
    | otherwise = go list offset (n - 1)
