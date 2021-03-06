module Day03.Part2 where

import qualified Data.Map as M

import Data.List (find)
import Data.Maybe (fromJust)

import Text.Printf (printf)
import System.TimeIt (timeItT)
import Control.Exception.Base (evaluate)

import Day03

-- | calculate the next value based on the current position
nextValue :: Position -> M.Map Position Int -> Int
nextValue (x, y) lm = foldl (\v p -> v + M.findWithDefault 0 p lm) 0 ps where
  ps = [
    (x+1, y),   (x-1, y),
    (x+1, y-1), (x-1, y-1),
    (x+1, y+1), (x-1, y+1),
    (x,   y+1), (x,   y-1)
    ]

-- | generate an endless/lazy list/stream of cells
cells :: [Move] -> [Cell]
cells ms = centerCell : go centerCell ms (M.insert (0, 0) 1 M.empty) where
  centerCell = Cell 1 (0, 0)
  go _ [] _ = error "Opps. Moves is suppose to be infinite."
  go previousCell (m':ms') lm = currentCell : go currentCell ms' (M.insert currentPosition currentValue lm) where
    currentPosition = nextPosition (position previousCell) (moveOffset m')
    currentValue = nextValue currentPosition lm
    currentCell = Cell currentValue currentPosition

-- | solve the puzzle. Input is the cell value we are looking for.
solve :: Int -> Int
solve target = value $ fromJust $ find (\(Cell v _) -> v > target) $ (cells moves)
--solve target = value $ head $ filter (\(Cell v _) -> v > target) $ (cells moves)

-- | main
main :: IO ()
main = do
  (time, result) <- timeItT $ evaluate (solve input)
  printf "Day03: Part2: number -> (%d, %f)\n" result time
