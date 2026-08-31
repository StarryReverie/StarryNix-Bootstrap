module Main where

import ExampleLib qualified

main :: IO ()
main = do
    putStrLn $ ExampleLib.greet "World"
    putStrLn $ ExampleLib.greet "Haskell"
