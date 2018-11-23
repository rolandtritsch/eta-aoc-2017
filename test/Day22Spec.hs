module Day22Spec where

import Prelude hiding (Left, Right)

import Data.Array

import Test.Hspec

import Day22
import qualified Day22.Part1 as P1
import qualified Day22.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the input" $ do
      let (Grid grid _ _ _) = input
      grid ! (0,0) `shouldBe` Infected

  describe "runSimulation" $ do
    it "should process the testcase(s) correctly" $ do
      let testGrid = [
            [Clean, Clean, Infected],
            [Infected, Clean, Clean],
            [Clean, Clean, Clean]
            ]
      let test = Grid (buildGrid testGrid) (Position 0 0) Up 0

      let burst1Grid = [
            [Clean, Clean, Infected],
            [Infected, Infected, Clean],
            [Clean, Clean, Clean]
            ]
      let burst1 = Grid (buildGrid burst1Grid) (Position 0 (-1)) Left 1
      runSimulation 1 P1.burst test `shouldBe` burst1

      let burst7Grid = [
            [Clean, Clean, Clean, Clean, Clean],
            [Infected, Clean, Clean, Infected, Clean],
            [Infected, Infected, Infected, Clean, Clean],
            [Clean, Clean, Clean, Clean, Clean],
            [Clean, Clean, Clean, Clean, Clean]
            ]
      let burst7 = Grid (buildGrid burst7Grid) (Position (-1) 0) Right 5
      runSimulation 7 P1.burst test `shouldBe` burst7

      let burst70Grid = [
            [Clean, Clean, Clean, Clean, Clean, Infected, Infected, Clean, Clean],
            [Clean, Clean, Clean, Clean, Infected, Clean, Clean, Infected, Clean],
            [Clean, Clean, Clean, Infected, Clean, Clean, Clean, Clean, Infected],
            [Clean, Clean, Infected, Clean, Infected, Clean, Clean, Clean, Infected],
            [Clean, Clean, Infected, Clean, Infected, Clean, Clean, Infected, Clean],
            [Clean, Clean, Clean, Clean, Clean, Infected, Infected, Clean, Clean],
            [Clean, Clean, Clean, Clean, Clean, Clean, Clean, Clean, Clean],
            [Clean, Clean, Clean, Clean, Clean, Clean, Clean, Clean, Clean],
            [Clean, Clean, Clean, Clean, Clean, Clean, Clean, Clean, Clean]
            ]
      let burst70 = Grid (buildGrid burst70Grid) (Position (-1) 1) Up 41
      runSimulation 70 P1.burst test `shouldBe` burst70

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 5305

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 2511424
