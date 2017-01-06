module Main where

import Control.Monad
import qualified Data.Char as Char


funny_string :: String -> Bool
funny_string s =
    let
        r = reverse s
        s2 = drop 1 s
        r2 = drop 1 r
        s3 = zip s2 s
        r3 = zip r2 r
        s4 = map (\(x,y) -> abs ((Char.ord x) - (Char.ord y))) s3
        r4 = map (\(x,y) -> abs ((Char.ord x) - (Char.ord y))) r3
        diffs = map (\(d1,d2) -> abs (d1 - d2)) $ zip s4 r4
    in sum diffs == 0

parseLine :: String -> IO()
parseLine s = do
    if funny_string s
        then putStrLn "Funny"
        else putStrLn "Not Funny"
    return ()

main :: IO ()
main = do
    nline <- getLine
    let n = read nline :: Int
    forM [ 1 .. n ] (\idx -> do
        l <- getLine
        parseLine l)
    return ()
