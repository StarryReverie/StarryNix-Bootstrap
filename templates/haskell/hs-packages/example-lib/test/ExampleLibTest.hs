module ExampleLibTest (
    unit_greetHello,
    unit_greetEmptyName,
    hprop_greetHasExclamation,
    hprop_greetContainsName,
    hprop_fauxReverse,
) where

import Data.List qualified as List
import Hedgehog (Property, assert, forAll, property, (===))
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
    last (greet name) === '!'

hprop_greetContainsName :: Property
hprop_greetContainsName = property $ do
    name <- forAll $ Gen.string (Range.linear 0 100) Gen.alpha
    assert $ List.isInfixOf name (greet name)

hprop_fauxReverse :: Property
hprop_fauxReverse = property $ do
    (xs :: [Int]) <- forAll $ Gen.list (Range.linear 1 1000) Gen.enumBounded
    let sx = fauxReverse xs
    xs === reverse sx
  where
    fauxReverse :: [a] -> [a]
    fauxReverse = drop 1 . reverse
