-- | 12. feladat
breakOn :: Char -> String -> (String, String)
breakOn _ [] = ([], [])
breakOn c s
  | c == head s = ([], s)
  | otherwise = (head s : l1, l2)
  where
    (l1, l2) = breakOn c (tail s)

-- >>> breakOn ' ' "haskell is cool"
-- ("haskell"," is cool")

-- | 13. feladat
splitOn :: Char -> String -> [String]
splitOn c s
  | null s2 = [s1]
  | otherwise = s1 : splitOn c (tail s2)
  where
    (s1, s2) = breakOn c s

--- >>> splitOn ' ' "haskell is cool"
-- ["haskell","is","cool"]

-- breakon ' ' "has is c"
--     (h:)
--         breakon ' ' "as is c"
--             (a:)
--                 breakon ' ' "s is c"
--                     (s:)
--                           breakon ' ' " is c"
--                             (, " is c")
-- ("has", " is c")

-- | 14. feladat
csv :: String -> [[String]]
csv x = [splitOn ',' line | line <- splitOn '\n' x, not $ null line]

-- >>> csv "a,b,c\nd,e,f\n"
-- [["a","b","c"],["d","e","f"]]

-- | 15. feladat
take' :: Int -> [a] -> [a]
take' _ [] = []
take' n _ | n <= 0 = []
take' n (x : xs) = x : take' (n - 1) xs

-- >>> take' (-1) "asdadfas"
-- ""

drop' :: Int -> [a] -> [a]
drop' _ [] = []
drop' n xs | n <= 0 = xs
drop' n (_ : xs) = drop' (n - 1) xs

-- >>> drop' (-1) "asdasd"
-- "asdasd"

-- | 4. feladat
langAndRegion :: String -> (String, String)
langAndRegion s = (take 2 s, drop 3 s)

-- >>> langAndRegion "en-US"
-- ("en","US")

-- | 5. feladat
zip' :: [a] -> [b] -> [(a, b)]
zip' (x : xs) (y : ys) = (x, y) : zip' xs ys
zip' _ _ = []

-- >>> zip' [1, 2, 3] [4, 5]
-- [(1,4),(2,5)]

-- | 6. feladat
unzip' :: [(a, b)] -> ([a], [b])
unzip' [] = ([], [])
unzip' ((a, b) : xs) = (a : as, b : bs)
  where
    (as, bs) = unzip' xs

-- >>> unzip' [(1,4),(2,5)]
-- ([1,2],[4,5])
