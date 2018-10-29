module Day03Spec where

import Test.Hspec

import Day03
import qualified Day03.Part1 as P1
import qualified Day03.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      input `shouldBe` 368078

  describe "moves" $ do
    it "should create the right moves" $ do
      take 24 moves `shouldBe` [
        MoveRight,
        MoveUp,
        MoveLeft,MoveLeft,
        MoveDown,MoveDown,
        MoveRight,MoveRight,
        MoveRight,
        MoveUp,MoveUp,MoveUp,
        MoveLeft,MoveLeft,MoveLeft,MoveLeft,
        MoveDown,MoveDown,MoveDown,MoveDown,
        MoveRight,MoveRight,MoveRight,MoveRight
        ]

  describe "cells - Part1" $ do
    it "should create the right sequence of cells" $ do
      take 2 (P1.cells moves) `shouldBe` [Cell 1 (0, 0), Cell 2 (0, 1)]

  describe "solve - Part1" $ do
    it "should solve the testcase(s)" $ do
      P1.solve 1 `shouldBe` 0
      P1.solve 12 `shouldBe` 3
      P1.solve 23 `shouldBe` 2
      P1.solve 1024 `shouldBe` 31

    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 371

  describe "cells - Part2" $ do
    it "should create the right sequence of cells" $ do
      take 5 (P2.cells moves) `shouldBe` [
        Cell 1 (0, 0),
        Cell 1 (0, 1),
        Cell 2 (1, 1),
        Cell 4 (1, 0),
        Cell 5 (1, -1)
        ]

  describe "solve - Part2" $ do
    it "should solve the testcase(s)" $ do
      P2.solve 2 `shouldBe` 4
      P2.solve 25 `shouldBe` 26
      P2.solve 362 `shouldBe` 747
      P2.solve 747 `shouldBe` 806

    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 369601
