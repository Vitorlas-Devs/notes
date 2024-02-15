import Data.Char

-- | Higher Order Functions
filterModified :: (a -> Bool) -> (a -> b) -> [a] -> [b]
filterModified p f = map f . filter p

-- >>> filterModified even (+1) [1..10]
-- [3,5,7,9,11]

-- >>> filterModified odd (*2) [1..10]
-- [2,6,10,14,18]

-- >>> filterModified (>5) (`div` 2) [1..10]
-- [3,3,4,4,5]

-- | Lambda Expressions

-- >>> map (\x -> x + 1) [1..10]
-- [2,3,4,5,6,7,8,9,10,11]

-- >>> filter (\x -> x `mod` 2 == 0) [1..10]
-- [2,4,6,8,10]

-- >>> map (\(x,y) -> x + y) [(1,2),(3,4),(5,6)]
-- [3,7,11]

-- | Map
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x : xs) = f x : map' f xs

-- >>> map' (+2) [2,3,4]
-- [4,5,6]

-- | Filter
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x : xs)
  | f x = x : filter' f xs
  | otherwise = filter' f xs

-- >>> filter' (\x -> x > 5) [1..10]
-- [6,7,8,9,10]-- >>> filter' (>5) [1..10]
-- [6,7,8,9,10]

-- | upperToLower
upperToLower :: String -> String
upperToLower s = map toLower $ filter isUpper s

-- >>> upperToLower "Hello World"
-- "hw"

-- | all
all' :: (a -> Bool) -> [a] -> Bool
all' f xs = and $ map f xs

all2 :: (a -> Bool) -> [a] -> Bool
all2 _ [] = True
all2 p (x : xs) = p x && all' p xs

-- >>> all' even [2,4,6,8,10]
-- True

-- >>> all' even [2,4,6,8,9]
-- False

-- | any
any' :: (a -> Bool) -> [a] -> Bool
any' f xs = or $ map f xs

any2 :: (a -> Bool) -> [a] -> Bool
any2 _ [] = False
any2 p (x : xs) = p x || any' p xs

-- >>> any' even [1,3,5,7,9]
-- False

-- >>> any' even [1,3,5,7,8]
-- True

-- | hasLongLines
-- if there is a line with more than 3 words
hasLongLines :: String -> Bool
-- hasLongLines s = any (\x -> length (words x) > 3) (lines s)
-- hasLongLines = any (\x -> length (words x) > 3) . lines
hasLongLines = any ((> 3) . length . words) . lines

-- >>> hasLongLines "Hello\nWorld\nHello World"
-- False

-- >>> hasLongLines "Hello\nWorld\nHello World\nHello World!\nHello World is a great song!"
-- True

-- | takeWhile
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' f (x : xs)
  | f x = x : takeWhile' f xs
  | otherwise = []

-- >>> takeWhile' (<5) [1..10]
-- [1,2,3,4]

-- | dropWhile
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' f (x : xs)
  | f x = dropWhile' f xs
  | otherwise = x : xs

-- >>> dropWhile (<5) [1..10]
-- [5,6,7,8,9,10]

-- >>> dropWhile' (<5) [1..10]
-- [6,7,8,9,10]

-- | Now that we know everything let's write ourselves a game
-- Hangman
-- 1. We need a word
-- 2. We need to know the guessed letters
-- 3. We need to know the number of guesses left
-- 4. We need to know the number of guesses made

-- | 1. We need a word
-- We need to read a word the console
-- We need to hide the word
-- We need to show the guessed letters
-- We need to show the number of guesses left
-- We need to show the number of guesses made
-- We need to show the word with the guessed letters