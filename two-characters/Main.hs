import Data.List

-- TODO optimize performance :)
-- make calculations with accumulator

unique :: String -> String
unique s = reverse $ unique' s ""
-- may be without reverse, order doesn't matter
-- but it will be reversed

unique' :: String -> String -> String
unique' [] acc = acc
unique' [ el ] acc = (el:acc)
unique' (x:y:s) acc
    | x == y = unique' (y:s) acc
    | otherwise = unique' (y:s) (x:acc)

unique_vals :: String -> String
unique_vals s = unique (sort s)

remove_from_string :: (Eq a) => [a] -> a -> [a]
remove_from_string s x = filter (\el -> el /= x) s

check_valid :: String -> Int
check_valid s = check_valid' s 0

check_valid' :: String -> Int -> Int
check_valid' [] x = x
check_valid' [ el ] x = x + 1
check_valid' (x:y:s) c
    | x == y = 0
    | otherwise = check_valid' (y:s) $ c + 1

calc :: String -> String -> Int
calc s u
    | (length u) == 2 = check_valid s
    | (length u) < 2 = error "Not expected"
    | otherwise =
        let
            rots = poss_rot u
            pos_len = map (\(el, l) -> calc (remove_from_string s el) l) rots
        in foldr max 0 pos_len

poss_rot :: (Eq a) => [a] -> [(a, [a])]
poss_rot s = map (\(x,y) -> ((head y),x ++ (tail y))) (map ((flip splitAt) s) [0 .. (length s) - 1])

join_first_elem_to_col :: (Eq a) => a -> [[a]] -> [[a]]
join_first_elem_to_col el cols =
    map (\l -> (el:l)) cols

-- permutations :: (Eq a) => [a] -> [[a]]
-- permutations s =
--     let
--         first_elem_choices = poss_rot s
--         collections_per_call = map (\(el, r) -> (join_first_elem_to_col el $ permutations r)) first_elem_choices
--     in intercalate [] collections_per_call

ascending_collection :: (Ord a) => [a] -> Bool
ascending_collection [] = True
ascending_collection [ el ] = True
ascending_collection (x:y:s)
    | x < y = ascending_collection (y:s)
    | otherwise = False

ordered_subcollections :: (Ord a) => Int -> [a] -> [[a]]
ordered_subcollections l s =
    filter ascending_collection (map (take l) (permutations s))

main :: IO()
main = do
    length_line <- getLine
    let length = read length_line :: Int
    data_line <- getLine
    putStrLn (show (calc data_line (unique_vals data_line)))
