-- Day09Spec.hs
module Day09Spec where

import Control.Monad (foldM)
import System.IO.Unsafe (unsafePerformIO)

import Test.Hspec

import Day09
import qualified Day09.Part1 as P1
import qualified Day09.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      take 5 input `shouldBe` "{{{{{"

  describe "transition" $ do
    it "should be able to process the input" $ do
      unsafePerformIO (foldM processEvent (InGroup 0 (Stats 0 0)) input) `shouldBe` (InGroup 0 (Stats 10800 4522))

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 10800

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 4522
