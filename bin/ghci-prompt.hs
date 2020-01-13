#!/usr/bin/env runghc

import Data.List
import System.Environment
import System.Process
import Text.Printf

main :: IO ()
main = do
  ms <- getArgs
  cols <- read <$> System.Process.readProcess "tput" ["cols"] ""
  (_, output, _) <- System.Process.readProcessWithExitCode "git" ["describe", "--contains", "--all", "HEAD"] ""
  let branch = if null output then "" else "(" ++ init output ++ ")"
      m = cols - length branch
      mns = Data.List.intercalate ", " []
  putStr (Text.Printf.printf "\ESC[46m\STX%*s\r%s\ESC[m\STX\n\ESC[1;36m\STXλ \ESC[m\STX" cols branch (if length mns > m then take (m - 2) mns ++ "…" else mns))
