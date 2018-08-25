-- Day07Spec.hs
module Day07Spec where

import Test.Hspec

import Day07
import qualified Day07.Part1 as P1
import qualified Day07.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      input !! 0 `shouldBe` ParseLeaf "occxa" 60
      input !! 1 `shouldBe` ParseNode "kozpul" 59 ["shavjjt","anujsv","tnzvo"]

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` "uownj"

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 596
