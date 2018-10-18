-- Day18Spec.hs
module Day18Spec where

import Test.Hspec

import Day18
import qualified Day18.Part1 as P1
import qualified Day18.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the input" $ do
      head input `shouldBe` "set l 1"

  describe "solve - Part1" $ do
    it "should solve the testcase(s)" $ do
      let testInput = [
            "set a 1",
            "add a 2",
            "mul a a",
            "mod a 5",
            "snd a",
            "set a 0",
            "rcv a",
            "jgz a -1",
            "set a 1",
            "jgz a -2"
            ]
      P1.solve testInput `shouldBe` 4

    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 3188

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 7112
