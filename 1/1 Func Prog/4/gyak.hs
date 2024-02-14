-- | Pattern matching exercises

f :: (Num a, Num b) => (a, a) -> (b, b) -> (a, b)
f (a, b) (c, d) = (a * b, c * d)

-- binary addition
add2 :: Int -> Int -> (Int, Int)
add2 0 0 = (0, 0)
add2 0 1 = (1, 0)
add2 1 0 = (1, 0)
add2 1 1 = (0, 1)

-- check if two brackets match
paren :: Char -> Char -> Bool
paren '{' '}' = True
paren '(' ')' = True
paren '[' ']' = True
paren _ _ = False

-- mini calculator
calc :: (Int, Char, Int) -> Int
calc (a, '+', b) = a + b
calc (a, '-', b) = a - b
calc (a, '*', b) = a * b
calc (a, '/', b) = a `div` b

-- check if a char is a space
isSpace :: Char -> Bool
isSpace ' ' = True
isSpace _ = False

-- | List

-- Lists are defined using square brackets:
-- [1, 2, 3, 4, 5]

-- Elements must be of the same type
-- You can only get the first element of a list and the rest of the list

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

tail2 :: [a] -> [a]
tail2 [] = []
tail2 (_:xs) = xs

head2 :: [a] -> a
head2 [] = error "empty list"
head2 (x:_) = x