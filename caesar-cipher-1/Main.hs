module Main where

import qualified Data.Char as Char

a_int :: Int
a_int = Char.ord 'a'

z_int :: Int
z_int = Char.ord 'z'


a_int2 :: Int
a_int2 = Char.ord 'A'

z_int2 :: Int
z_int2 = Char.ord 'Z'

encrypt_char :: Int -> Char -> Char
encrypt_char k c
    | (Char.ord c) >= a_int && (Char.ord c) <= z_int
        = Char.chr (a_int + (((Char.ord c) - a_int) + k) `mod` 26)
    | (Char.ord c) >= a_int2 && (Char.ord c) <= z_int2
        = Char.chr (a_int2 + (((Char.ord c) - a_int2) + k) `mod` 26)
    | otherwise = c

main :: IO ()
main = do
    nline <- getLine
    data_line <- getLine
    kline <- getLine

    let n = read nline :: Int
    let k = read kline :: Int

    let encrypted = map (encrypt_char k) data_line
    putStrLn encrypted

