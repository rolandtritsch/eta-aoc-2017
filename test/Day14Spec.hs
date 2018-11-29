module Day14Spec where

import qualified Data.Set as S

import Test.Hspec

import Day14
import qualified Day14.Part1 as P1
import qualified Day14.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the input" $ do
      input `shouldBe` "ugkiagan"

  describe "buildGrid" $ do
    it "should build a/the grid (for the testcase(s))" $ do
      take 6 (head (buildGrid "flqrgnkx")) `shouldBe` [True,True,False,True,False,True]

  describe "solve - Part1" $ do
    it "should solve the testcase(s)" $ do
      P1.solve "flqrgnkx" `shouldBe` 8108

    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 8292

  describe "findRegion" $ do
    it "should detect the loop" $ do
      let grid = [
            [True, True, True],
            [True, False, True],
            [True, True, True]
            ]
      findRegion grid S.empty (0,0) `shouldBe` S.fromList [(0,0),(0,1),(0,2),(1,0),(1,2),(2,0),(2,1),(2,2)]

    it "should solve the testcase(s)" $ do
      let grid = buildGrid "flqrgnkx"
      findRegion grid S.empty (0,0) `shouldBe` S.fromList [(0,0),(0,1),(1,1)]
      findRegion grid S.empty (0,1) `shouldBe` S.fromList [(0,0),(0,1),(1,1)]
      findRegion grid S.empty (2,4) `shouldBe` S.fromList [(2,4),(3,4),(3,5),(4,4),(5,4)]
      findRegion grid S.empty (3,2) `shouldBe` S.fromList [(0,13),(0,14),(0,15),(0,22),(0,23),(0,24),(0,25),(1,12),(1,14),(1,22),(1,23),(1,24),(1,25),(2,11),(2,12),(2,13),(2,14),(2,15),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(3,2),(3,10),(3,11),(3,12),(3,13),(3,15),(3,16),(3,18),(3,22),(3,24),(3,28),(3,29),(4,1),(4,2),(4,10),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,21),(4,24),(4,28),(4,29),(5,0),(5,1),(5,7),(5,8),(5,9),(5,10),(5,11),(5,13),(5,15),(5,16),(5,17),(5,18),(5,19),(5,20),(5,21),(5,22),(5,23),(5,24),(5,25),(5,26),(5,27),(5,28),(5,29),(6,1),(6,5),(6,8),(6,9),(6,19),(6,20),(6,22),(6,25),(6,26),(6,27),(7,0),(7,1),(7,3),(7,5),(7,6),(7,9),(7,10),(7,11),(7,18),(7,19),(7,21),(7,22),(8,0),(8,1),(8,2),(8,3),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(8,18),(9,0),(9,1),(9,3),(9,5),(9,6),(9,7),(9,8),(10,3),(10,8),(10,10),(10,11),(11,1),(11,2),(11,3),(11,4),(11,5),(11,6),(11,7),(11,8),(11,9),(11,10),(11,11),(12,3),(12,5),(12,6),(12,10),(12,13),(12,14),(12,15),(13,4),(13,5),(13,8),(13,9),(13,10),(13,13),(13,14),(14,4),(14,9),(14,10),(14,12),(14,13),(15,4),(15,5),(15,10),(15,11),(15,13),(16,2),(16,3),(16,5),(16,6),(16,9),(16,10),(16,11),(16,12),(16,13),(16,14),(17,0),(17,1),(17,2),(17,3),(17,4),(17,5),(17,10),(17,12),(17,14),(18,1),(18,2),(18,3),(18,4),(18,5),(18,6),(18,10),(18,12),(18,13),(18,14),(18,15),(18,16),(19,2),(19,4),(19,5),(19,13),(19,14),(20,4),(20,12),(20,13),(20,14),(21,12),(21,13),(21,14),(21,15),(22,13),(22,14),(22,15),(22,16),(23,14)]

  describe "findRegions" $ do
    it "should detect the regions (in the testcase(s))" $ do
      let grid = [
            [True, True, False,True, True, False],
            [True, True, False,True, True, False],
            [False, False, False,False, False, False],
            [True, True, False,True, True, False],
            [True, True, False,True, True, False],
            [False, False, False,False, False, False]
            ]
      findRegions grid `shouldBe` S.fromList [
        S.fromList [(0,0),(0,1),(1,0),(1,1)],
        S.fromList [(0,3),(0,4),(1,3),(1,4)],
        S.fromList [(3,0),(3,1),(4,0),(4,1)],
        S.fromList [(3,3),(3,4),(4,3),(4,4)]
        ]

  describe "solve - Part2" $ do
    it "should solve the testcase(s)" $ do
      P2.solve "flqrgnkx" `shouldBe` 1242

    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 1069
