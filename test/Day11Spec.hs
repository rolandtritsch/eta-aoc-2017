module Day11Spec where

import Test.Hspec

import Day11
import qualified Day11.Part1 as P1
import qualified Day11.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      take 5 input `shouldBe` ["nw", "n", "n", "se", "ne"]

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 810

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 1567
