module ExampleLibTest where

import Data.List qualified as List
import Hedgehog (Property, assert, forAll, property)
import Hedgehog.Gen qualified as Gen
import Hedgehog.Range qualified as Range
import Test.Tasty.HUnit ((@?=))

import ExampleLib (greet)

unit_greetHello :: IO ()
unit_greetHello = greet "World" @?= "Hello, World!"

unit_greetEmptyName :: IO ()
unit_greetEmptyName = greet "" @?= "Hello, !"

hprop_greetHasExclamation :: Property
hprop_greetHasExclamation = property $ do
    name <- forAll $ Gen.string (Range.linear 0 100) Gen.alpha
    assert (last (greet name) == '!')

hprop_greetContainsName :: Property
hprop_greetContainsName = property $ do
    name <- forAll $ Gen.string (Range.linear 0 100) Gen.alpha
    assert (List.isInfixOf name (greet name))
