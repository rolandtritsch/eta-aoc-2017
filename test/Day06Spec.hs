-- Day06Spec.hs
module Day06Spec where

import Test.Hspec

import Day06
import qualified Day06.Part1 as P1
import qualified Day06.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      input `shouldBe` [10,3,15,10,5,15,5,15,9,2,5,8,5,2,3,6]

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 14029

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 2765
