-- Day15Spec.hs
module Day15Spec where

import Test.Hspec

import Day15
import qualified Day15.Part1 as P1
import qualified Day15.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the input" $ do
      input `shouldBe` ""

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 594

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 328
