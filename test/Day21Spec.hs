module Day21Spec where

import Test.Hspec

import Day21
import qualified Day21.Part1 as P1
import qualified Day21.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read and process the input" $ do
      head input `shouldBe` Rule ["..", ".."] ["###",".##","#.."]
      length input `shouldBe` 864

  describe "copyGrid" $ do
    it "should be able to process the start grid" $ do
      copyGrid 0 0 0 startGrid `shouldBe` []
      copyGrid 0 0 1 startGrid `shouldBe` ["."]
      copyGrid 0 0 2 startGrid `shouldBe` [".#",".."]
      copyGrid 1 1 2 startGrid `shouldBe` [".#","##"]
      copyGrid 0 0 3 startGrid `shouldBe` startGrid

  describe "enhance" $ do
    it "should be able to process the start grid" $ do
      enhance input [startGrid] `shouldBe` [["###.","#.#.",".#..",".#.#"]]

  describe "divide" $ do
    it "should be able to process the start grid" $ do
      divide (head (enhance input [startGrid])) `shouldBe` [["##","#."],["#.","#."],[".#",".#"],["..",".#"]]

  describe "join" $ do
    it "should be able to process the start grid" $ do
      join (divide (head (enhance input [startGrid]))) `shouldBe` ["###.","#.#.",".#..",".#.#"]

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 205

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 3389823
