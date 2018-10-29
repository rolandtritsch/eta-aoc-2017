module Day15Spec where

import Test.Hspec

import Day15
import qualified Day15.Part1 as P1
import qualified Day15.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "generator" $ do
    it "should produce the correct (first 5) values (for the testcase(s))" $ do
      take 5 (generator (65, 16807, 2147483647, 1)) `shouldBe` [1092455,1181022009,245556042,1744312007,1352636452]
      take 5 (generator (8921, 48271, 2147483647, 1)) `shouldBe` [430625591,1233683848,1431495498,137874439,285222916]

  describe "matching" $ do
    it "should find the correct (for the testcase(s))" $ do
      let as = take 5 (generator (65, 16807, 2147483647, 1))
      let bs = take 5 (generator (8921, 48271, 2147483647, 1))
      let pairs = zip as bs
      let matches = map (\(a, b) -> matching a b) pairs
      matches `shouldBe` [False,False,True,False,False]

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve `shouldBe` 594

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve `shouldBe` 328
