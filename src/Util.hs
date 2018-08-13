-- Util.hs
module Util where

import System.IO.Unsafe

inputRaw :: String -> [String]
inputRaw fileName = lines $ take (length contents - 1) contents
  where
    contents = unsafePerformIO $ readFile fileName
