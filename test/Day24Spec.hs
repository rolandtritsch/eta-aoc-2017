module Day24Spec where

import Data.Tree

import Test.Hspec

import Day24
import qualified Day24.Part1 as P1
import qualified Day24.Part2 as P2

run :: IO ()
run = hspec $ do
  let testComponents = [
        Component 0 2 2,
        Component 2 2 4,
        Component 2 3 5,
        Component 3 4 7,
        Component 3 5 8,
        Component 0 1 1,
        Component 10 1 11,
        Component 9 10 19
        ]

  describe "input" $ do
    it "should read the (raw) input" $ do
      head input `shouldBe` Component 14 42 56

  describe "root" $ do
    it "should show the right tree (for the test components)" $ do
      let bridges' = root testComponents
      --putStrLn $ drawTree (fmap show bridges')
      take 2 (flatten bridges') `shouldBe` [0, 2]

    it "should show the right tree" $ do
      let bridges' = root input
      --putStrLn $ drawTree (fmap show bridges')
      take 2 (flatten bridges') `shouldBe` [0, 30]

  describe "bridges" $ do
    it "should return the right bridges (for the test components)" $ do
      bridges (root testComponents) `shouldBe` [[0,2,5,7],[0,2,5,8],[0,2,4,5,7],[0,2,4,5,8],[0,1,11,19]]

    it "should return the right bridges" $ do
      head (bridges (root input)) `shouldBe` [0,30,32,5,35]

  describe "solve - Part1" $ do
    it "should solve the puzzle (for the test components)" $ do
      P1.solve testComponents `shouldBe` 31

    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 1695

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 1673
