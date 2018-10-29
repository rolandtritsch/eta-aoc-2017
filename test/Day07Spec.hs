module Day07Spec where

import Test.Hspec

import Data.Maybe (fromJust)
import qualified Data.Map as M

import Data.Tree (levels)

import Day07
import qualified Day07.Part1 as P1
import qualified Day07.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      fromJust (M.lookup "occxa" input) `shouldBe` (60, [])
      fromJust (M.lookup "kozpul" input) `shouldBe` (59, ["shavjjt","anujsv","tnzvo"])

  describe "build" $ do
    it "should build the tree" $ do
      head (levels (build input (findRoot input))) `shouldBe` [12]

  describe "calcWeight" $ do
    it "should calculate the right weight" $ do
      calcWeight (build input (findRoot input)) `shouldBe` 387014

  describe "isBalanced" $ do
    it "should see that the tree is not balanced" $ do
      isBalanced (build input (findRoot input)) `shouldBe` False

  describe "findBadNode" $ do
    it "should find the (one/first) bad node" $ do
      levels (findBadNode (build input (findRoot input))) `shouldBe` [[14],[797,604,26,2040],[225,273,75,213,149,113,85,237,261,219,145,270,308,107,24,344,292,61,61],[24,24,99,99,30,30,62,62,74,74,44,44,44,44,12,12,21,21,58,58,43,43,16,16,16,83,83,83,83,83,83,83,6,6,32,32]]

  describe "correctWeight" $ do
    it "should return the correct weight for a/the bad node" $ do
      correctWeight (findBadNode (build input (findRoot input))) `shouldBe` 596

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` "uownj"

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 596
