module Day02Spec where

import Test.Hspec

import Day02
import qualified Day02.Part1 as P1
import qualified Day02.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      head input `shouldBe` [737,1866,1565,1452,1908,1874,232,1928,201,241,922,281,1651,1740,1012,1001]

  describe "checksums" $ do
    it "should calc the correct checksum(s)" $ do
      P1.checksums [[10, 5], [100, 50]] `shouldBe` [5, 50]
      P1.checksums input `shouldBe` [1727,540,1014,1494,690,1833,1888,853,7608,2031,2799,2226,343,5238,4322,319]

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 34925

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 221
