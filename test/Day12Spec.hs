-- Day12Spec.hs
module Day12Spec where

import Test.Hspec

import Day12
import qualified Day12.Part1 as P1
import qualified Day12.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      head input `shouldBe` "0 <-> 46, 1376"

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 152

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 186
