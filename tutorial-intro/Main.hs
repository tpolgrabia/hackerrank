module Main where
import Data.Array.IO

readInt :: IO Int
readInt = do
    s <- getLine
    let [ (val, r) ] = reads s :: [ (Int, String) ]
    return val

readIntList :: IO [Int]
readIntList = do
    s <- getLine
    let iarr = map read $ words s
    return iarr

findIdxInArray ::  IOArray Int Int -> Int -> Int -> IO Int
findIdxInArray arr n v = do
    findIdxInArray' arr 1 n v

findIdxInArray' :: IOArray Int Int -> Int -> Int -> Int -> IO Int
findIdxInArray' arr i j v
    | i == j = do
        v2 <- readArray arr i
        if v2 == v
            then return i
            else return (-1)
    | i + 1 == j = do
        v2 <- readArray arr i
        v3 <- readArray arr (i+1)
        if v2 == v
            then return (i-1)
        else if v3 == v
            then return i
            else return (-1)

    | i > j = error "Invalid state i > j"
    | otherwise = do
        let sidx = (i+j) `quot` 2
        v2 <- readArray arr sidx
        if v2 < v
            then findIdxInArray' arr sidx j v
            else findIdxInArray' arr i sidx v

main :: IO ()
main = do
    v <- readInt
    n <- readInt
    l <- readIntList
    if (length l) /= n
        then do
            putStrLn "Invalid data"
        else do
            arr <- newListArray (1,n) l
            idx <- findIdxInArray arr n v
            putStrLn (show  idx)
