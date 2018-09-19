-- Day10Spec.hs
module Day10Spec where

import Test.Hspec

import Day10
import qualified Day10.Part1 as P1
import qualified Day10.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      input `shouldBe` "165,1,255,31,87,52,24,113,0,91,148,254,158,2,73,153"

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 4112

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` "2f8c3d2100fdd57cec130d928b0fd2dd"
