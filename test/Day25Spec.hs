module Day25Spec where

import Test.Hspec

import Day25
import qualified Day25.Part1 as P1

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      head input `shouldBe` "Begin in state A."

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 4769
