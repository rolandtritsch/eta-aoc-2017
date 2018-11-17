module Day20Spec where

import Test.Hspec

import Day20
import qualified Day20.Part1 as P1
import qualified Day20.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the (raw) input" $ do
      head input `shouldBe` Particle (Position 1199 (-2918) 1457) (Velocity (-13) 115 (-8)) (Acceleration (-7) 8 (-10))

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` 243

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` 648
