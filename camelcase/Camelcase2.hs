import Control.Applicative
import Control.Monad
import System.IO

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
    
parseLine :: String -> IO()
parseLine s = do
    putStrLn $ show . camelCase $ s

main :: IO ()
main = do
    s <- getLine
    parseLine s
