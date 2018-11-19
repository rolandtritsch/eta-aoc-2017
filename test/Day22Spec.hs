module Day22Spec where

import Test.Hspec

import Day22
import qualified Day22.Part1 as P1
import qualified Day22.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      head input `shouldBe` "...###.#.#.##...##.#..##."

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 5305

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 2511424
