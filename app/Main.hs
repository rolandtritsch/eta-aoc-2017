module Main where

import Text.Printf

import Day01
import Day02
import qualified Day02.Part1 as D02P1
import qualified Day02.Part2 as D02P2
import Day03
import qualified Day03.Part1 as D03P1
import qualified Day03.Part2 as D03P2

main :: IO ()
main = do
  printf "Day01: Part1: captcha -> %d\n" (Day01.captcha Day01.input)
  printf "Day01: Part2: captcha' -> %d\n" (Day01.captcha' Day01.input)
  printf "Day02: Part1: checksum -> %d\n" (D02P1.solve Day02.input)
  printf "Day02: Part2: evenly -> %d\n" (D02P2.solve Day02.input)
  printf "Day03: Part1: lookup -> %d\n" (D03P1.solve Day03.input)
  printf "Day03: Part2: find -> %d\n" (D03P2.solve Day03.input)
