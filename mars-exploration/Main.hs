module Main where

parseSosMsgAndCountErrors :: String -> Int
parseSosMsgAndCountErrors s = parseSosMsgAndCountErrors' s 0

parseSosMsgAndCountErrors' :: String -> Int -> Int
parseSosMsgAndCountErrors' "" c = c
parseSosMsgAndCountErrors' [ el ] acc = acc + 1
parseSosMsgAndCountErrors' [ el1, el2 ] acc = acc + 2
parseSosMsgAndCountErrors' (x:y:z:l) acc =
    let
        acc1 = if x == 'S' then acc else acc + 1
        acc2 = if y == 'O' then acc1 else acc1 + 1
        acc3 = if z == 'S' then acc2 else acc2 + 1
    in parseSosMsgAndCountErrors' l acc3


main :: IO ()
main = do
    line <- getLine
    putStrLn $ show . parseSosMsgAndCountErrors $ line
