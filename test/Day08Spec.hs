module Day08Spec where

import Test.Hspec

import qualified Data.Map as M

import Day08
import qualified Day08.Part1 as P1
import qualified Day08.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      map register (take 5 input) `shouldBe` ["g","k","jq","sh","w"]

  describe "doIt" $ do
    it "should map the first 5 correctly" $ do
      map (doIt M.empty) (take 5 input) `shouldBe` [True, True, True, False, True]

  describe "exec" $ do
    it "should fold the first 5 correctly" $ do
      foldl exec M.empty (take 5 input) `shouldBe` M.fromList [("g",-231),("jq",880),("k",567),("w",595)]

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 4163

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 5347
