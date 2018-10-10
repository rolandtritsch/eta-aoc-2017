-- Day13Spec.hs
module Day13Spec where

import Test.Hspec

import Day13
import qualified Day13.Part1 as P1
import qualified Day13.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the input" $ do
      head input `shouldBe` "0: 4"

    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 1632

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 3834136
