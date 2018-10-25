module Main where

import Text.Printf
import System.TimeIt
import Control.Exception.Base (evaluate)

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
  (d01p1t, d01p1r) <- timeItT $ evaluate (D01.captcha D01.input)
  printf "Day01: Part1: captcha -> (%f, %d)\n" d01p1t d01p1r
  (d01p2t, d01p2r) <- timeItT $ evaluate (D01.captcha' D01.input)
  printf "Day01: Part2: captcha' -> (%f, %d)\n" d01p2t d01p2r

  (d02p1t, d02p1r) <- timeItT $ evaluate (D02P1.solve D02.input)
  printf "Day02: Part1: checksum -> (%f, %d)\n" d02p1t d02p1r
  (d02p2t, d02p2r) <- timeItT $ evaluate (D02P2.solve D02.input)
  printf "Day02: Part2: checksum -> (%f, %d)\n" d02p2t d02p2r

  (d03p1t, d03p1r) <- timeItT $ evaluate (D03P1.solve D03.input)
  printf "Day03: Part1: distance -> (%f, %d)\n" d03p1t d03p1r
  (d03p2t, d03p2r) <- timeItT $ evaluate (D03P2.solve D03.input)
  printf "Day03: Part2: number -> (%f, %d)\n" d03p2t d03p2r

  (d04p1t, d04p1r) <- timeItT $ evaluate (D04P1.solve D04.input)
  printf "Day04: Part1: countvalid -> (%f, %d)\n" d04p1t d04p1r
  (d04p2t, d04p2r) <- timeItT $ evaluate (D04P2.solve D04.input)
  printf "Day04: Part2: countvalid -> (%f, %d)\n" d04p2t d04p2r

  --(d05p1t, d05p1r) <- timeItT $ evaluate (D05P1.solve D05.input)
  --printf "Day05: Part1: countsteps -> (%f, %d)\n" d05p1t d05p1r
  --(d05p2t, d05p2r) <- timeItT $ evaluate (D05P2.solve D05.input)
  --printf "Day05: Part2: countsteps -> (%f, %d)\n" d05p2t d05p2r

  (d06p1t, d06p1r) <- timeItT $ evaluate (D06P1.solve D06.input)
  printf "Day06: Part1: cycles -> (%f, %d)\n" d06p1t d06p1r
  (d06p2t, d06p2r) <- timeItT $ evaluate (D06P2.solve D06.input)
  printf "Day06: Part2: cycles -> (%f, %d)\n" d06p2t d06p2r

  --printf "Day07: tree -> (%f, %s)\n" (Day07.drawWeightedTree D07.input)

  (d07p1t, d07p1r) <- timeItT $ evaluate (D07P1.solve D07.input)
  printf "Day07: Part1: findroot -> (%f, %s)\n" d07p1t d07p1r
  (d07p2t, d07p2r) <- timeItT $ evaluate (D07P2.solve D07.input)
  printf "Day07: Part2: correctweight -> (%f, %d)\n" d07p2t d07p2r

  (d08p1t, d08p1r) <- timeItT $ evaluate (D08P1.solve D08.input)
  printf "Day08: Part1: maxregister -> (%f, %d)\n" d08p1t d08p1r
  (d08p2t, d08p2r) <- timeItT $ evaluate (D08P2.solve D08.input)
  printf "Day08: Part2: maxregisters -> (%f, %d)\n" d08p2t d08p2r

  (d09p1t, d09p1r) <- timeItT $ evaluate (D09P1.solve D09.input)
  printf "Day09: Part1: score -> (%f, %d)\n" d09p1t d09p1r
  (d09p2t, d09p2r) <- timeItT $ evaluate (D09P2.solve D09.input)
  printf "Day09: Part2: chars -> (%f, %d)\n" d09p2t d09p2r

  (d10p1t, d10p1r) <- timeItT $ evaluate (D10P1.solve D10.input)
  printf "Day10: Part1: knot -> (%f, %d)\n" d10p1t d10p1r
  --(d10p2t, d10p2r) <- timeItT $ evaluate (D10P2.solve D10.input)
  --printf "Day10: Part2: hash -> (%f, %s)\n" d10p2t d10p2r

  (d11p1t, d11p1r) <- timeItT $ evaluate (D11P1.solve D11.input)
  printf "Day11: Part1: steps -> (%f, %d)\n" d11p1t d11p1r
  (d11p2t, d11p2r) <- timeItT $ evaluate (D11P2.solve D11.input)
  printf "Day11: Part2: max -> (%f, %d)\n" d11p2t d11p2r

  (d12p1t, d12p1r) <- timeItT $ evaluate (D12P1.solve D12.input)
  printf "Day12: Part1: programs -> (%f, %d)\n" d12p1t d12p1r
  (d12p2t, d12p2r) <- timeItT $ evaluate (D12P2.solve D12.input)
  printf "Day12: Part2: groups -> (%f, %d)\n" d12p2t d12p2r

  (d13p1t, d13p1r) <- timeItT $ evaluate (D13P1.solve D13.input)
  printf "Day13: Part1: score -> (%f, %d)\n" d13p1t d13p1r
  --(d13p2t, d13p2r) <- timeItT $ evaluate (D13P2.solve D13.input)
  --printf "Day13: Part2: pass -> (%f, %d)\n" d13p2t d13p2r

  --(d14p1t, d14p1r) <- timeItT $ evaluate (D14P1.solve D14.input)
  --printf "Day14: Part1: used -> (%f, %d)\n" d14p1t d14p1r
  --(d14p2t, d14p2r) <- timeItT $ evaluate (D14P2.solve D14.input)
  --printf "Day14: Part2: regions -> (%f, %d)\n" d14p2t d14p2r

  --(d15p1t, d15p1r) <- timeItT $ evaluate (D15P1.solve)
  --printf "Day15: Part1: count -> (%f, %d)\n" d15p1t d15p1r
  --(d15p2t, d15p2r) <- timeItT $ evaluate (D15P2.solve)
  --printf "Day15: Part2: count -> (%f, %d)\n" d15p2t d15p2r

  (d16p1t, d16p1r) <- timeItT $ evaluate (D16P1.solve D16.input)
  printf "Day16: Part1: moves -> (%f, %s)\n" d16p1t d16p1r
  (d16p2t, d16p2r) <- timeItT $ evaluate (D16P2.solve D16.input)
  printf "Day16: Part2: dance -> (%f, %s)\n" d16p2t d16p2r

  (d17p1t, d17p1r) <- timeItT $ evaluate (D17P1.solve D17.input)
  printf "Day17: Part1: next -> (%f, %d)\n" d17p1t d17p1r
  --(d17p2t, d17p2r) <- timeItT $ evaluate (D17P2.solve D17.input)
  --printf "Day17: Part2: zero -> (%f, %d)\n" d17p2t d17p2r

  (d18p1t, d18p1r) <- timeItT $ evaluate (D18P1.solve D18.input)
  printf "Day18: Part1: frequency -> (%f, %d)\n" d18p1t d18p1r
  (d18p2t, d18p2r) <- timeItT $ evaluate (D18P2.solve D18.input)
  printf "Day18: Part2: deadlock -> (%f, %d)\n" d18p2t d18p2r
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
