module Day24Spec where

import Test.Hspec

import Day24
import qualified Day24.Part1 as P1
import qualified Day24.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      head input `shouldBe` "14/42"

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 1695

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 1673
