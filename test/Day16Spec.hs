-- Day16Spec.hs
module Day16Spec where

import Test.Hspec

import Day16
import qualified Day16.Part1 as P1
import qualified Day16.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the input" $ do
      take 5 input `shouldBe` "x5/11"

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` "bijankplfgmeodhc"

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` "bpjahknliomefdgc"
