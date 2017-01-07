module Main where

import qualified Data.List as List
import qualified Data.Map  as Map

calc_freq :: (Ord a) => [a] -> Map.Map a Int
calc_freq l = Map.fromListWith (\x y -> x + y) [(x,y) | x <- l, y <- [1]]

full_freqs :: [Int] -> Int -> Int -> Map.Map Int Int
full_freqs l s e =
    let
        m1 = calc_freq l
        m2 = Map.fromList [(x, 0) | x <- [ s .. e ]]
    in Map.unionWith (\x y -> x + y) m1 m2

full_freqs_leq :: [Int] -> Int -> Int -> [Int]
full_freqs_leq l s e =
    let
        freqs = full_freqs l s e
        l_freqs = Map.elems freqs
    in scanl1 (+) l_freqs

readInt :: IO Int
readInt = do
    l <- getLine
    let x = read l :: Int
    return x

parseLines :: Int -> IO [Int]
parseLines 0 = return []
parseLines n
    | n < 0 = error "Invalida invocation n < 0"
    | otherwise = do
        c <- getContents
        let l_input = take n $ lines c
        let numbers = map  (read . head . words) $ l_input
        return numbers

main :: IO ()
main = do
    n <- readInt
    numbers <- parseLines n
    let sorted_numbers = full_freqs_leq numbers 0 99
    putStrLn (List.intercalate " " $ map show sorted_numbers)
