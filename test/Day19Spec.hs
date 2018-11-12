module Day19Spec where

import Data.List (elemIndex)
import Data.Maybe (fromJust)

import Test.Hspec

import Day19
import qualified Day19.Part1 as P1
import qualified Day19.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      fromJust (elemIndex '|' (head input)) `shouldBe` 163

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` "PVBSCMEQHY"

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 17736
