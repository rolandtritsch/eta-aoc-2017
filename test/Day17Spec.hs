-- Day17Spec.hs
module Day17Spec where

import Test.Hspec

import Day17
import qualified Day17.Part1 as P1
import qualified Day17.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      input `shouldBe` 371

  describe "forward" $ do
    it "should calc the next postion" $ do
      forward 100 0 1 `shouldBe` 0
      forward 1 0 2 `shouldBe` 1
      forward 1 1 2 `shouldBe` 0
      forward 2 0 2 `shouldBe` 0
      forward 2 1 2 `shouldBe` 1

  describe "insertAt" $ do
    it "should insert value at/after position" $ do
      insertAt 1 0 [0] `shouldBe` [0,1]
      insertAt 2 0 [0,1] `shouldBe` [0,2,1]
      insertAt 2 1 [0,1] `shouldBe` [0,1,2]

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 1311
{-
  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 39170601
-}
