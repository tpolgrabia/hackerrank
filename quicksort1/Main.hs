module Main where

import qualified Data.List as List

readInt :: IO Int
readInt = do
    l <- getLine
    let x = read l :: Int
    return x

readIntList :: IO [Int]
readIntList = do
    l <- getLine
    let wl = words l
    return (map read wl)

partition :: Ord a => [a] -> [a]
partition [] = []
partition [ el ] = [ el ]
partition (x:xs) =
    let
        xs1 = filter (< x) xs
        xs2 = filter (>= x) xs
    in xs1 ++ [x] ++ xs2

main :: IO ()
main = do
    n <- readInt
    numbers <- readIntList
    if n /= (length numbers)
    then return ()
    else do
        let sorted_numbers = partition numbers
        putStrLn (List.intercalate " " $ map show sorted_numbers)
