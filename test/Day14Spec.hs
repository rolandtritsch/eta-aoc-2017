module Day14Spec where

import Test.Hspec

import Day14
import qualified Day14.Part1 as P1
import qualified Day14.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the input" $ do
      input `shouldBe` "ugkiagan"

  describe "buildGrid" $ do
    it "should build a/the grid (for the testcase(s))" $ do
      take 6 (head (buildGrid "flqrgnkx")) `shouldBe` [True,True,False,True,False,True]

  describe "solve - Part1" $ do
    it "should solve the testcase(s)" $ do
      P1.solve "flqrgnkx" `shouldBe` 8108

    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 8292

  describe "solve - Part2" $ do
    it "should solve the testcase(s)" $ do
      P2.solve "flqrgnkx" `shouldBe` 1242

    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 1069
