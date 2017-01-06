fac :: Int -> Int

fac 0 = 1
fac 1 = 1
fac n
    | n < 0 = error $ "Unexpected value: " ++ (show n)
    | otherwise = n * fac (n - 1)

pascal_item :: Int -> Int -> Int
pascal_item n 0 = 1
pascal_item n r
    | n > r  = fac n `quot` ((fac r) * fac(n - r))
    | n == r = 1
    | n < r = error "Not expected"
    | n < 1 = error "Not expected"
    | otherwise = error "Not expected"

pascal_line' :: Int -> Int -> IO()
pascal_line' n 0 = do
    putStrLn (show 1)

pascal_line' n k = do
    putStr (show (pascal_item  n k) ++ " ")
    pascal_line' n (k - 1)

pascal_line :: Int -> IO()
pascal_line n = do
    pascal_line' n n

pascal_lines :: Int -> IO()
pascal_lines k = do
    mapM_ pascal_line [ 0 .. (k - 1) ]

main :: IO()
main = do
    line <- getLine
    let k = read line :: Int
    pascal_lines k
