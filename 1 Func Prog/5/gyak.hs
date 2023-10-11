-- \| Lists

import Data.Char hiding (isDigit, isLetter)
import Data.List

-- Ranges

-- >>> [1..10]
-- [1,2,3,4,5,6,7,8,9,10]

-- >>> ['a'..'z']
-- "abcdefghijklmnopqrstuvwxyz"

-- >>> ['a'..'z'] ++ ['A'..'Z']
-- "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

-- >>> [1,3..10]
-- [1,3,5,7,9]

hello1 :: [Char]
hello1 = ['H', 'e', 'l', 'l', 'o']

hello2 :: String
hello2 = "Hello"

-- >>> hello1 == hello2
-- True

listgenInt :: Int -> Int -> [Int]
listgenInt n m
  | n > m = [] -- this stops the recursion
  | m == n = [n] -- this adds the last element
  | otherwise = n : listgenInt (n + 1) m -- we add the first element and call the function with the next element

-- >>> listgenInt 1 10
-- [1,2,3,4,5,6,7,8,9,10]

-- Generic list generator
-- we need to add the Ord constraint because we use the succ function and it requires the type to be in the Ord typeclass (to be able to compare elements)
-- Enum is also needed because we use the succ function, it returns the next element in the Enum typeclass (the next character in the alphabet, the next number, etc.)

listgen :: (Enum a, Ord a) => a -> a -> [a]
listgen n m
  | n > m = []
  | m == n = [n]
  | otherwise = n : listgen (succ n) m -- succ is the successor function, it returns the next element

-- >>> listgen 1 10
-- [1,2,3,4,5,6,7,8,9,10]

-- >>> listgen 'a' 'z'
-- "abcdefghijklmnopqrstuvwxyz"

-- init: returns all elements of a list except the last one

init' :: [a] -> [a]
init' [] = []
init' [x] = []
init' (x : xs) = x : init' xs -- the ':' operator adds an element to the beginning of a list

-- >>> init' [1,2,3,4,5]
-- [1,2,3,4]

-- >>> init' "Hello"
-- "Hell"

-- | Feladatok
head' :: [a] -> a
head' [] = error "ERROR: Received empty list"
head' (x : _) = x

-- >>> head' ['a', 'b', 'c']
-- 'a'

tail' :: [a] -> [a]
tail' [] = error "ERROR: Received empty list"
tail' (_ : xs) = xs

-- >>> tail' [1.3, 4.5, 6.7]
-- [4.5,6.7]

null' :: [a] -> Bool
null' [] = True
null' _ = False

-- >>> null' []
-- True
-- >>> null' [1, 2, 3]
-- False

isSingleton :: [a] -> Bool
isSingleton [_] = True
isSingleton _ = False

-- >>> isSingleton []
-- False
-- >>> isSingleton [1]
-- True
-- >>> isSingleton [1, 2]
-- False

toFirstUpper :: String -> String
toFirstUpper [] = []
toFirstUpper (x : xs) = toUpper x : xs

-- >>> toFirstUpper "jake"
-- "Jake"
-- >>> toFirstUpper "finn the human"
-- "Finn the human"

isLetter' :: Char -> Bool
isLetter' c = c `elem` ['a' .. 'z'] ++ ['A' .. 'Z']

-- >>> map isLetter' ['a', 'B', '?', ' ', '1']
-- [True,True,False,False,False]

isDigit' :: Char -> Bool
isDigit' c = c `elem` ['0' .. '9']

-- >>> map isDigit' ['a', 'B', '?', ' ', '1']
-- [False,False,False,False,True]

mountain :: Int -> [Int]
mountain n = [1 .. n] ++ [n - 1, n - 2 .. 1]

-- | List comprehensions

-- >>> mountain 5
-- [1,2,3,4,5,4,3,2,1]

divisors :: Int -> [Int]
divisors n = filter (\x -> n `mod` x == 0) [1 .. n]

divisors' :: Int -> [Int]
divisors' n = [x | x <- [1 .. n], n `mod` x == 0]

divisorsOrPrime :: Int -> Either [Int] String
divisorsOrPrime n
  | length divs == 2 = Right "prime"
  | otherwise = Left divs
  where
    divs = divisors n

-- >>> divisorsOrPrime 7
-- Right "prime"

-- >>> divisors 12 == divisors' 12
-- True

powersOfTwo :: Int -> [Int]
powersOfTwo n = [2 ^ x | x <- [0 .. n]]

-- >>> powersOfTwo 10
-- [1,2,4,8,16,32,64,128,256,512,1024]

powersOfTwo' :: [Int]
powersOfTwo' = [2 ^ x | x <- [0 ..]]

-- >>> take 10 powersOfTwo'
-- [1,2,4,8,16,32,64,128,256,512]
