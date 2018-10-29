module Day04Spec where

import Test.Hspec

import Day04
import qualified Day04.Part1 as P1
import qualified Day04.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      (head $ input) `shouldBe` ["sayndz","zfxlkl","attjtww","cti","sokkmty","brx","fhh","suelqbp"]

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 383

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 265
