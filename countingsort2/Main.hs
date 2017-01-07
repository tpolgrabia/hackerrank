module Main where

import qualified Data.List as List
import qualified Data.Map  as Map

counting_sort :: (Ord a) => [a] -> [a]
counting_sort l =
    let
        freqs = Map.fromListWith (\x y -> x + y) [(x,y) | x <- l, y <- [1]]
    in List.intercalate [] $ List.map (\(x,y) -> take y (iterate id x))
                           $ Map.toList freqs 

readInt :: IO Int
readInt = do
    l <- getLine
    let x = read l :: Int
    return x

readIntList :: IO [Int]
readIntList = do
    line <- getLine
    let lw = words line
    let numbers = map read lw
    return numbers

main :: IO ()
main = do
    n <- readInt
    numbers <- readIntList
    let sorted_numbers = counting_sort numbers
    putStrLn (List.intercalate " " $ map show sorted_numbers)


