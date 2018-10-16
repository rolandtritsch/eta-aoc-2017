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

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 1311

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 39170601
