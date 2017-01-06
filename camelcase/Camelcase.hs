main :: IO()

camelCase :: String -> Int
camelCase "" = 0
camelCase (x:xs)
    | elem x [ 'A' .. 'Z' ] = camelCase' (x:xs)
    | otherwise = 1 + (camelCase' xs)

camelCase' :: String -> Int
camelCase' "" = 0
camelCase' (x:xs)
    | elem x [ 'A' .. 'Z' ] = 1 + (camelCase' xs)
    | otherwise = camelCase' xs

main = do
    line <- getLine
    putStrLn $ show . camelCase $ line
