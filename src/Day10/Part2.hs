-- Part2.hs
module Day10.Part2 where

import Day10

-- | solve the puzzle
solve :: String -> String
solve input' = dense2hex $ sparse2dense $ hash $ knots (encode input') rounds
