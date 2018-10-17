module Main where

import Text.Printf

import qualified Day01 as D01
import qualified Day02 as D02
import qualified Day02.Part1 as D02P1
import qualified Day02.Part2 as D02P2
import qualified Day03 as D03
import qualified Day03.Part1 as D03P1
import qualified Day03.Part2 as D03P2
import qualified Day04 as D04
import qualified Day04.Part1 as D04P1
import qualified Day04.Part2 as D04P2
import qualified Day05 as D05
import qualified Day05.Part1 as D05P1
import qualified Day05.Part2 as D05P2
import qualified Day06 as D06
import qualified Day06.Part1 as D06P1
import qualified Day06.Part2 as D06P2
import qualified Day07 as D07
import qualified Day07.Part1 as D07P1
import qualified Day07.Part2 as D07P2
import qualified Day08 as D08
import qualified Day08.Part1 as D08P1
import qualified Day08.Part2 as D08P2
import qualified Day09 as D09
import qualified Day09.Part1 as D09P1
import qualified Day09.Part2 as D09P2
import qualified Day10 as D10
import qualified Day10.Part1 as D10P1
import qualified Day10.Part2 as D10P2
import qualified Day11 as D11
import qualified Day11.Part1 as D11P1
import qualified Day11.Part2 as D11P2
import qualified Day12 as D12
import qualified Day12.Part1 as D12P1
import qualified Day12.Part2 as D12P2
import qualified Day13 as D13
import qualified Day13.Part1 as D13P1
import qualified Day13.Part2 as D13P2
import qualified Day14 as D14
import qualified Day14.Part1 as D14P1
import qualified Day14.Part2 as D14P2
import qualified Day15 as D15
import qualified Day15.Part1 as D15P1
import qualified Day15.Part2 as D15P2
import qualified Day16 as D16
import qualified Day16.Part1 as D16P1
import qualified Day16.Part2 as D16P2
import qualified Day17 as D17
import qualified Day17.Part1 as D17P1
import qualified Day17.Part2 as D17P2
import qualified Day18 as D18
import qualified Day18.Part1 as D18P1
import qualified Day18.Part2 as D18P2

main :: IO ()
main = do
  printf "Day01: Part1: captcha -> %d\n" (D01.captcha D01.input)
  printf "Day01: Part2: captcha' -> %d\n" (D01.captcha' D01.input)
  printf "Day02: Part1: checksum -> %d\n" (D02P1.solve D02.input)
  printf "Day02: Part2: checksum -> %d\n" (D02P2.solve D02.input)
  printf "Day03: Part1: distance -> %d\n" (D03P1.solve D03.input)
  printf "Day03: Part2: number -> %d\n" (D03P2.solve D03.input)
  printf "Day04: Part1: countvalid -> %d\n" (D04P1.solve D04.input)
  printf "Day04: Part2: countvalid -> %d\n" (D04P2.solve D04.input)
  --printf "Day05: Part1: countsteps -> %d\n" (D05P1.solve D05.input)
  --printf "Day05: Part2: countsteps -> %d\n" (D05P2.solve D05.input)
  printf "Day06: Part1: cycles -> %d\n" (D06P1.solve D06.input)
  printf "Day06: Part2: cycles -> %d\n" (D06P2.solve D06.input)
  --printf "Day07: tree -> %s\n" (Day07.drawWeightedTree D07.input)
  printf "Day07: Part1: findroot -> %s\n" (D07P1.solve D07.input)
  printf "Day07: Part2: correctweight -> %d\n" (D07P2.solve D07.input)
  printf "Day08: Part1: maxregister -> %d\n" (D08P1.solve D08.input)
  printf "Day08: Part2: maxregisters -> %d\n" (D08P2.solve D08.input)
  printf "Day09: Part1: score -> %d\n" (D09P1.solve D09.input)
  printf "Day09: Part2: chars -> %d\n" (D09P2.solve D09.input)
  printf "Day10: Part1: knot -> %d\n" (D10P1.solve D10.input)
  --printf "Day10: Part2: hash -> %s\n" (D10P2.solve D10.input)
  printf "Day11: Part1: steps -> %d\n" (D11P1.solve D11.input)
  printf "Day11: Part2: max -> %d\n" (D11P2.solve D11.input)
  printf "Day12: Part1: programs -> %d\n" (D12P1.solve D12.input)
  printf "Day12: Part2: groups -> %d\n" (D12P2.solve D12.input)
  printf "Day13: Part1: score -> %d\n" (D13P1.solve D13.input)
  --printf "Day13: Part2: pass -> %d\n" (D13P2.solve D13.input)
  --printf "Day14: Part1: used -> %d\n" (D14P1.solve D14.input)
  --printf "Day14: Part2: regions -> %d\n" (D14P2.solve D14.input)
  --printf "Day15: Part1: count -> %d\n" (D15P1.solve)
  --printf "Day15: Part2: count -> %d\n" (D15P2.solve)
  printf "Day16: Part1: moves -> %s\n" (D16P1.solve D16.input)
  printf "Day16: Part2: dance -> %s\n" (D16P2.solve D16.input)
  printf "Day17: Part1: next -> %d\n" (D17P1.solve D17.input)
  printf "Day17: Part2: zero -> %d\n" (D17P2.solve D17.input)
  printf "Day18: Part1: frequency -> %d\n" (D18P1.solve D18.input)
  printf "Day18: Part2: deadlock -> %d\n" (D18P2.solve D18.input)
{--
    println(s"Day19: Part1: path -> ${Day19.Part1.solve(Day19.input)}")
    println(s"Day19: Part2: steps -> ${Day19.Part2.solve(Day19.input)}")
    println(s"Day20: Part1: findclosest -> ${Day20.Part1.solve(Day20.input)}")
    println(s"Day20: Part2: nocollisions -> ${Day20.Part2.solve(Day20.input)}")
    println(s"Day21: Part1: after5 -> ${Day21.Part1.solve(Day21.input)}")
    println(s"Day21: Part2: after18 -> ${Day21.Part2.solve(Day21.input)}")
    println(s"Day22: Part1: simple -> ${Day22.Part1.solve(Day22.input)}")
    println(s"Day22: Part2: advanced -> ${Day22.Part2.solve(Day22.input)}")
    println(s"Day23: Part1: run -> ${Day23.Part1.solve(Day23.input)}")
    println(s"Day23: Part2: run -> ${Day23.Part2.solve(Day23.input)}")
    println(s"Day24: Part1: strongest -> ${Day24.Part1.solve(Day24.input)}")
    println(s"Day24: Part2: longest -> ${Day24.Part2.solve(Day24.input)}")
    println(s"Day25: Part1: run -> ${Day25.Part1.solve(Day25.input)}")

--}
