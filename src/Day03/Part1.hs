-- Part1.hs
module Day03.Part1 where

import Day03

-- | generate an endless/lazy list/stream of cells
cells :: [Move] -> [Cell]
cells ms = centerCell : go centerCell ms where
  centerCell = Cell 1 (0, 0)
  go _ [] = error "Opps. Moves is suppose to be infinite."
  go previousCell (m':ms') = currentCell : go currentCell ms' where
    currentCell = Cell ((value previousCell) + 1) (nextPosition (position previousCell) (moveOffset m'))

-- | solve the puzzle. Input is the cell we are looking for.
--
-- Note: Input is based/centered on square 1. Stream is (obviously)
-- indexed/based on index 0. This is why we need to pass on target - 1.
solve :: Int -> Int
solve target = distance $ (cells moves) !! (target - 1)
