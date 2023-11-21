import Data.List

-- | 1. feladat
dropSpaces :: String -> String
dropSpaces = dropWhile (== ' ')

-- >>> dropSpaces " a sdsa sdfa "
-- "a sdsa sdfa "

-- >>> dropSpaces ""
-- ""

-- >>> dropSpaces "          b"
-- "b"

-- | 2. feladat
trim :: String -> String
trim = reverse . dropSpaces . reverse . dropSpaces

-- >>> trim "  sadf a   asdf      "
-- "sadf a   asdf"

-- | 3. feladat
-- >>> words "asd asdf asd"
-- ["asd","asdf","asd"]

-- >>> unwords ["asd","asdf","asd"]
-- "asd asdf asd"

monogram :: String -> String
monogram x = unwords (map (\x -> head x : ".") $ words x)

monogram2 :: String -> String
monogram2 x = unwords [head word : "." | word <- words x]

-- >>> monogram "Bartók Béla"
-- "B. B."

-- >>> monogram2 "Bartók Béla"
-- "B. B."

-- | 4. feladat
uniq :: Eq a => [a] -> [a]
uniq [] = []
uniq (x : xs) = x : uniq (filter (/= x) xs)

-- >>> uniq "asdaabd"
-- "asdb"

uniq2 :: Ord a => [a] -> [a]
uniq2 [] = []
uniq2 (x : xs) = map head $ group $ sort xs

-- >>> uniq2 "asdaabd"
-- "abds"

-- | 5. feladat
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys
zipWith' _ _ _ = []

-- >>> zipWith' min [1, 3, 9, 2] [0, 6, 4, 1]
-- [0,3,4,1]

-- >>> zipWith' (*) [1, 3, 9, 2] [0, 6, 4]
-- [0,18,36]

-- | 6. feladat
dotProduct :: Num a => [a] -> [a] -> a
dotProduct xs ys = sum (zipWith' (*) xs ys)

-- >>> dotProduct [1, 2] [3, 4]
-- 11

-- | 7. feladat
isPrime :: Int -> Bool
-- isPrime x = not (any (\n -> x `mod` n == 0) [2 .. x - 1])

isPrime x
  | x < 2 = False
  | otherwise = not (any (\n -> x `mod` n == 0) [2 .. floor (sqrt (fromIntegral x))])

primes :: [Int]
primes = filter isPrime [2 ..]

-- >>> isPrime 137
-- True

-- >>> take 5 primes
-- [2,3,5,7,11]
