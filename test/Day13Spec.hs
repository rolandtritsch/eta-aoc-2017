module Day13Spec where

import qualified Data.Map.Strict as M

import Test.Hspec

import Day13
import qualified Day13.Part1 as P1
import qualified Day13.Part2 as P2

run :: IO ()
run = hspec $ do
  let testInput = M.fromList [
        (0,3),
        (1,2),
        (4,4),
        (6,4)
        ]
  let tfw = buildFirewall testInput
  let fw = buildFirewall input

  describe "input" $ do
    it "should read the input" $ do
      input M.! 0 `shouldBe` 4

  describe "buildFirewall" $ do
    it "should build the firewall (with no delay)" $ do
      buildFirewall input `shouldBe` [(0,4),(1,2),(2,3),(3,0),(4,5),(5,0),(6,6),(7,0),(8,6),(9,0),(10,4),(11,0),(12,8),(13,0),(14,8),(15,0),(16,9),(17,0),(18,8),(19,0),(20,6),(21,0),(22,6),(23,0),(24,8),(25,0),(26,12),(27,0),(28,12),(29,0),(30,12),(31,0),(32,10),(33,0),(34,8),(35,0),(36,8),(37,0),(38,10),(39,0),(40,12),(41,0),(42,12),(43,0),(44,12),(45,0),(46,14),(47,0),(48,14),(49,0),(50,14),(51,0),(52,14),(53,0),(54,12),(55,0),(56,12),(57,0),(58,12),(59,0),(60,12),(61,0),(62,14),(63,0),(64,14),(65,0),(66,14),(67,0),(68,14),(69,0),(70,14),(71,0),(72,0),(73,0),(74,0),(75,0),(76,0),(77,0),(78,0),(79,0),(80,14),(81,0),(82,14),(83,0),(84,0),(85,0),(86,14),(87,0),(88,17),(89,0),(90,0),(91,0),(92,0),(93,0),(94,30),(95,0),(96,0),(97,0),(98,18)]

  describe "calcSecScore" $ do
    it "should calc the right sec score (for the testcase(s) of part 1)" $ do
      calcSecScore 0 tfw `shouldBe` (True, 24)
    it "should calc the right sec score (for part 1)" $ do
      calcSecScore 0 fw `shouldBe` (True, 1632)
    it "should calc the right sec score (for the testcase(s) of part 2)" $ do
      calcSecScore 1 tfw `shouldBe` (True, 2)
      calcSecScore 4 tfw `shouldBe` (True, 0)
      calcSecScore 10 tfw `shouldBe` (False, 0)
    it "should calc the right sec score (for part 2)" $ do
      calcSecScore 150456 fw `shouldBe` (True, 0)
      calcSecScore 3834135 fw `shouldBe` (True, 2)
      calcSecScore 3834136 fw `shouldBe` (False, 0)

  describe "solve - Part1" $ do
    it "should solve the testcase(s)" $ do
      P1.solve testInput `shouldBe` 24
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 1632

  describe "solve - Part2" $ do
    it "should solve the testcase(s)" $ do
      P2.solve testInput `shouldBe` 10
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 3834136
