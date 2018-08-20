-- Day05Spec.hs
module Day05Spec where

import Test.Hspec

import Day05
import qualified Day05.Part1 as P1
import qualified Day05.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      (take 10 $ input) `shouldBe` [0, 1, 0, 0, 1, -3, 0, 0, 2, -2]

  describe "solve - Part1" $ do
    it "should solve the testcases" $ do
      P1.solve [0, 3, 0, 1, -3] `shouldBe` 5

    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 372139

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 29629538
