-- Part2.hs
module Day02.Part2 where

-- import Day02

-- | calculate the evenlyDivisible for every row
evenlyDivisible :: [[Int]] -> [Int]
evenlyDivisible rows = map process rows where
    process :: [Int] -> Int
    process row = head [div x y | x <- row, y <- row, x > y, mod x y == 0]

-- | solve the puzzle
solve :: [[Int]] -> Int
solve rows = sum $ evenlyDivisible rows
