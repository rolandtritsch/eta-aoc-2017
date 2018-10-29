module Day16Spec where

import Test.Hspec

import Day16
import qualified Day16.Part1 as P1
import qualified Day16.Part2 as P2

run :: IO ()
run = hspec $ do
  describe "input" $ do
    it "should read the input" $ do
      head input `shouldBe` "x5/11"

  describe "spin" $ do
    it "should spin/swap the programs" $ do
      spin 0 "abcde" `shouldBe` "abcde"
      spin 1 "abcde" `shouldBe` "eabcd"
      spin 3 "abcde" `shouldBe` "cdeab"
      spin 5 "abcde" `shouldBe` "abcde"

  describe "exchange" $ do
    it "should exhange two programs" $ do
      exchange 0 0 "abcde" `shouldBe` "abcde"
      exchange 3 4 "abcde" `shouldBe` "abced"
      exchange 0 4 "abcde" `shouldBe` "ebcda"
      exchange 4 0 "abcde" `shouldBe` "ebcda"

  describe "partner" $ do
    it "should partner two programs" $ do
      partner 'a' 'a' "abcde" `shouldBe` "abcde"
      partner 'd' 'e' "abcde" `shouldBe` "abced"
      partner 'a' 'e' "abcde" `shouldBe` "ebcda"
      partner 'e' 'a' "abcde" `shouldBe` "ebcda"

  describe "solve - Part1" $ do
    it "should solve the puzzle" $ do
      P1.solve input `shouldBe` "bijankplfgmeodhc"

  describe "solve - Part2" $ do
    it "should solve the puzzle" $ do
      P2.solve input `shouldBe` "bpjahknliomefdgc"
