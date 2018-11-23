module Day22Spec where

import Prelude hiding (Left, Right)

import qualified Data.Map as M

import Test.Hspec

import Day22
import qualified Day22.Part1 as P1
import qualified Day22.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the input" $ do
      let (Grid grid _ _ _) = input
      grid M.! (Position 0 0) `shouldBe` Infected

  describe "runSimulation" $ do
    it "should process the testcase(s) correctly" $ do
      let testGrid = [
            [Clean, Clean, Infected],
            [Infected, Clean, Clean],
            [Clean, Clean, Clean]
            ]
      let test = Grid (buildGrid testGrid) (Position 0 0) Up 0
      let notClean (_, s) = s /= Clean

      let (Grid b1a b1p b1d b1i) = runSimulation 1 P1.burst test
      filter notClean (M.toAscList b1a) `shouldBe` [(Position (-1) 1,Infected),(Position 0 (-1),Infected),(Position 0 0,Infected)]
      b1p `shouldBe` Position 0 (-1)
      b1d `shouldBe` Left
      b1i `shouldBe` 1

      let (Grid b7a b7p b7d b7i) = runSimulation 7 P1.burst test
      filter notClean (M.toAscList b7a) `shouldBe` [(Position (-1) (-2),Infected),(Position (-1) 1,Infected),(Position 0 (-2),Infected),(Position 0 (-1),Infected),(Position 0 0,Infected)]
      b7p `shouldBe` Position (-1) 0
      b7d `shouldBe` Right
      b7i `shouldBe` 5

      let (Grid b70a b70p b70d b70i) = runSimulation 70 P1.burst test
      filter notClean (M.toAscList b70a) `shouldBe` [(Position (-4) 1,Infected),(Position (-4) 2,Infected),(Position (-3) 0,Infected),(Position (-3) 3,Infected),(Position (-2) (-1),Infected),(Position (-2) 4,Infected),(Position (-1) (-2),Infected),(Position (-1) 0,Infected),(Position (-1) 4,Infected),(Position 0 (-2),Infected),(Position 0 0,Infected),(Position 0 3,Infected),(Position 1 1,Infected),(Position 1 2,Infected)]
      b70p `shouldBe` Position (-1) 1
      b70d `shouldBe` Up
      b70i `shouldBe` 41

      let (Grid bb7a bb7p bb7d bb7i) = runSimulation 7 P2.burst test
      filter notClean (M.toAscList bb7a) `shouldBe` [(Position (-1) (-2),Weakend),(Position (-1) (-1),Weakend),(Position (-1) 1,Infected),(Position 0 (-2),Infected),(Position 0 0,Weakend)]
      bb7p `shouldBe` Position 0 (-3)
      bb7d `shouldBe` Left
      bb7i `shouldBe` 1

      let (Grid bb100a bb100p bb100d bb100i) = runSimulation 100 P2.burst test
      filter notClean (M.toAscList bb100a) `shouldBe` [(Position (-3) (-2),Weakend),(Position (-3) (-1),Weakend),(Position (-2) (-2),Infected),(Position (-2) (-1),Infected),(Position (-2) 0,Weakend),(Position (-2) 1,Weakend),(Position (-2) 2,Weakend),(Position (-2) 3,Weakend),(Position (-1) (-3),Weakend),(Position (-1) (-2),Infected),(Position (-1) (-1),Infected),(Position (-1) 0,Flagged),(Position (-1) 1,Infected),(Position (-1) 3,Weakend),(Position 0 (-5),Weakend),(Position 0 (-4),Flagged),(Position 0 (-3),Flagged),(Position 0 (-1),Weakend),(Position 0 0,Infected),(Position 0 1,Flagged),(Position 0 2,Flagged),(Position 1 (-5),Weakend),(Position 1 (-4),Flagged),(Position 1 (-3),Weakend),(Position 1 (-2),Infected),(Position 1 (-1),Flagged),(Position 1 0,Weakend),(Position 1 1,Weakend),(Position 1 2,Weakend),(Position 2 (-2),Infected),(Position 2 (-1),Infected),(Position 3 (-2),Weakend),(Position 3 (-1),Weakend)]
      bb100p `shouldBe` Position 1 (-1)
      bb100d `shouldBe` Up
      bb100i `shouldBe` 26

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 5305

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 2511424
