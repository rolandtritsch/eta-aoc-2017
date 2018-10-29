module Day10.Part2 where

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day10

-- | solve the puzzle
solve :: String -> String
solve input' = dense2hex $ sparse2dense $ hash $ knots (encode input') rounds

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day10: Part2: hash -> (%f, %s)\n" time result
