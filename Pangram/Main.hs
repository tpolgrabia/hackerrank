module Main where

import qualified Data.Set  as Set
import qualified Data.Char as Char

alphabet :: Set.Set Char
alphabet = Set.fromList "abcdefghijklmnopqrstuvwxyz"

remove_blanks :: String -> String
remove_blanks s = filter (\x -> Set.member x alphabet) s

inserted_set :: String -> Set.Set Char
inserted_set s = Set.fromList (remove_blanks (map Char.toLower s))

check_pangram :: String -> Bool
check_pangram s = Set.size (inserted_set s) == Set.size alphabet

main :: IO ()
main = do
    line <- getLine
    if check_pangram line
        then putStrLn "pangram"
        else putStrLn "not pangram"
