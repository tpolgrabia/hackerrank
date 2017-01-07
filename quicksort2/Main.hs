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

dumpList :: (Ord a, Show a) => [a] -> IO()
dumpList l = do
    if (length l) >= 2
    then putStrLn (List.intercalate " " $ map show l)
    else return ()

quicksort :: (Ord a, Show a) => [a] -> IO [a]
quicksort [] = return []
quicksort [ el ] = return [ el ]
quicksort (x:xs) = do
    let xs1 = filter (< x) (x:xs)
    let xs2 = filter (> x) (x:xs)
    let xs3 = filter (== x) (x:xs)
    q1 <- quicksort xs1
    q2 <- quicksort xs2
    let res = q1 ++ xs3 ++ q2
    dumpList res
    return res

main :: IO ()
main = do
    n <- readInt
    numbers <- readIntList
    if n /= (length numbers)
    then do
        let sorted_numbers = numbers
        putStrLn (List.intercalate " " $ map show sorted_numbers)
    else do
        x <- quicksort numbers
        return ()
