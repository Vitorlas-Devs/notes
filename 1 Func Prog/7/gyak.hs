-- | 1. feladat
sum' :: [a] -> Int
sum' [] = 0
sum' (x : xs) = 1 + sum' xs

-- | 2. feladat
last' :: [a] -> a
last' [x] = x
last' (x : xs) = last' xs

-- >>> last' [1, 2, 3, 4, 5]

-- | 3. feladat
and' :: [Bool] -> Bool
and' [] = True
and' (x : xs) = x && and' xs

-- | 4. feladat
or' :: [Bool] -> Bool
or' [] = False
or' (x : xs) = x || or' xs

-- | 5. feladat
repeat' :: Enum a => a -> [a]
repeat' x = [x, x ..]

-- >>> take 10 (repeat' 'a')
-- "aaaaaaaaaa"

-- | 6. feladat
replicate' :: Enum a => Int -> a -> [a]
replicate' n x = take n (repeat' x)

replicate'' :: Int -> a -> [a]
replicate'' 0 _ = []
replicate'' n x = x : replicate'' (n - 1) x

-- >>> replicate' 10 'a'
-- "aaaaaaaaaa"

-- >>> replicate'' 10 'a'
-- "aaaaaaaaaa"

-- | 7. feladat
format :: Int -> String -> String
format n x = replicate'' (n - length x) ' ' ++ x

-- >>> format 10 "asd"
-- "       asd"

-- | 8. feladat
insert :: Ord a => a -> [a] -> [a]
insert n [] = [n]
insert n (x : xs)
  | n < x = n : x : xs
  | otherwise = x : insert n xs

-- >>> insert 4 [1, 3, 5]
-- [1,3,4,5]

-- | 9. feladat
sort :: Ord a => [a] -> [a]
sort xs = foldr insert [] xs

sort2 :: Ord a => [a] -> [a]
sort2 [] = []
sort2 (x : xs) = insert x (sort2 xs)

-- >>> sort [3, -6, 2]
-- [-6,2,3]

{-
sort [2,5,1,9] = insert 2 (sort [5,1,9])
    sort [5,1,9] = insert 5 sort [1,9]
        sort [1,9] = insert 1 sort [9]
            sort [9] = insert 9 sort []
            [9]
        [1,9]
    [1,5,9]
[1, 2, 5, 9]
-}

-- | 10. feladat
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge x@(x' : xs) y@(y' : ys)
  | x' < y' = x' : merge xs y
  | otherwise = y' : merge x ys

-- >>> merge [1, 2, 6] [4, 5]
-- [1,2,4,5,6]

-- | 11. feladat
mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort l@(x : xs) = merge (mergeSort l1) (mergeSort l2)
  where
    (l1, l2) = splitAt (length l `div` 2) l

mergeSort' :: Ord a => [a] -> [a]
mergeSort' [] = []
mergeSort' [x] = [x]
mergeSort' l =
  let (l1, l2) = splitAt (length l `div` 2) l
   in merge (mergeSort' l1) (mergeSort' l2)

-- >>> mergeSort [3, 1, 4, 2]
-- [1,2,3,4]