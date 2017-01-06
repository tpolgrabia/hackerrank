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

remove_elem_from_col :: (Eq a) => [a] -> a -> [a]
remove_elem_from_col s x = filter (/= x) s

remove_elems_from_col :: (Eq a) => [a] -> [a] -> [a]
remove_elems_from_col col elems =
    foldr (\el res -> remove_elem_from_col res el) col elems


correct_sub :: (Eq a) => [a] -> Bool
correct_sub [] = True
correct_sub [ el ] = True
correct_sub (x:y:s)
    | x == y = False
    | otherwise = correct_sub (y:s)

calc' :: String -> String -> Int
calc' s u =
    let
        nr_of_chars_to_be_removed = (length u) - 2
        removal_choices = ordered_subcollections nr_of_chars_to_be_removed s
        gen_subs = map (\rchoice -> remove_elems_from_col s rchoice) removal_choices
        correct_subs = filter (\el -> correct_sub el ) gen_subs
        sub_lengths = map length correct_subs
    in foldr max 0 sub_lengths

calc :: String -> Int
calc s = calc' s (unique_vals s)

main :: IO()
main = do
    length_line <- getLine
    let length = read length_line :: Int
    data_line <- getLine
    putStrLn (show (calc data_line))
