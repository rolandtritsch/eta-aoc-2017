-- Day06Spec.hs
module Day06Spec where

import Test.Hspec

import Prelude hiding (cycle)

import Day06
import qualified Day06.Part1 as P1
import qualified Day06.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      input `shouldBe` [10,3,15,10,5,15,5,15,9,2,5,8,5,2,3,6]

  describe "mostBlocksIndex" $ do
    it "should return the max index" $ do
      mostBlocksIndex [0, 1, 2, 3, 4, 5] `shouldBe` 5
      mostBlocksIndex (reverse [0, 1, 2, 3, 4, 5]) `shouldBe` 0

    it "should return the first max index, even if there is a second one" $ do
      mostBlocksIndex [0, 1, 2, 3, 4, 5, 0, 5] `shouldBe` 5

  describe "update" $ do
    it "should update the first element" $ do
      update 0 99 [1] `shouldBe` [99]

    it "should update the n-th element" $ do
      update 2 99 [0, 1, 2, 3, 4] `shouldBe` [0, 1, 99, 3, 4]

    it "should update the last element" $ do
      update 4 99 [0, 1, 2, 3, 4] `shouldBe` [0, 1, 2, 3, 99]

  describe "cycle" $ do
    it "cycle through all memorybanks" $ do
      cycle [0, 0, 5, 0, 0] `shouldBe` [1, 1, 1, 1, 1]
      cycle [1, 1, 5, 2, 2] `shouldBe` [2, 2, 1, 3, 3]
      cycle [1, 1, 7, 2, 2] `shouldBe` [2, 2, 1, 4, 4]

      let testBanks = [0, 2, 7, 0]
      let step1 = cycle testBanks
      step1 `shouldBe` [2, 4, 1, 2]

      let step2 = cycle step1
      step2 `shouldBe` [3, 1, 2, 3]

      let step3 = cycle step2
      step3 `shouldBe` [0, 2, 3, 4]

      let step4 = cycle step3
      step4 `shouldBe` [1, 3, 4, 1]

      let step5 = cycle step4
      step5 `shouldBe` step1

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 14029

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 2765
