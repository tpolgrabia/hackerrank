main :: IO()

reduceString :: String -> String
reduceString "" = ""
reduceString [ el ] = [ el ]
reduceString (c1:c2:xs)
    | c1 == c2 = reduceString xs
    | otherwise =
        let
            os = (c1 : reduceString (c2:xs))
        in
            if os == (c1 : c2 : xs)
            then os
            else reduceString os

main = do
    line <- getLine
    let res = reduceString line
    if res == ""
        then putStrLn "Empty String"
        else putStrLn res
