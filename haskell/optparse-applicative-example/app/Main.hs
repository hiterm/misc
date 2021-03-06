module Main where

import Data.Semigroup ((<>))
import Options.Applicative

data Sample = Sample
  { hello :: String,
    quiet :: Bool,
    enthusiasm :: Int,
    ps :: String
  }

sample :: Parser Sample
sample =
  Sample
    <$> strOption
      ( long "hello"
          <> metavar "TARGET"
          <> help "Target for the greeting"
      )
    <*> switch
      ( long "quiet"
          <> short 'q'
          <> help "Whether to be quiet"
      )
    <*> option
      auto
      ( long "enthusiasm"
          <> help "How enthusiastically to greet"
          <> showDefault
          <> value 1
          <> metavar "INT"
      )
    <*> argument str (metavar "MESSAGE")

main :: IO ()
main = greet =<< execParser opts
  where
    opts =
      info
        (sample <**> helper)
        ( fullDesc
            <> progDesc "Print a greeting for TARGET"
            <> header "hello - a test for optparse-applicative"
        )

greet :: Sample -> IO ()
greet (Sample h False n m) = putStrLn $ "Hello, " ++ h ++ replicate n '!' ++ " " ++ m
greet _ = return ()
