-- | The Wildcard Pattern in Pattern Matching

-- The wildcard pattern is denoted by an underscore (_). It matches any value, and
-- discards it. It is useful when we want to match a value, but do not care what
-- it is. For example, the following function returns the first element of a list:

first :: [a] -> a
first (x:_) = x

-- The wildcard pattern is used to match the tail of the list, which we do not
-- care about. If we had used a variable instead, we would have to give it a
-- name, even though we do not use it:

first' :: [a] -> a
first' (x:xs) = x

-- | Recursive Functions

-- The are two types of recursion: primitive recursion and structural recursion.

-- Primitive recursion is used when the recursive call is made on a smaller
-- version of the same problem. For example, the factorial function is defined
-- as follows:

fact :: Integer -> Integer
fact n = factH n 1

factH :: Integer -> Integer -> Integer
factH n m 
  | n == m    = n
  | n > m     = m * factH n (m + 1)
  | n < m     = error "factH: n < m"

-- We can declare the helper function inside the main function, so that it is
-- not visible from outside:

fact' :: Integer -> Integer
fact' n = factH' n 1
  where
    factH' :: Integer -> Integer -> Integer
    factH' n m 
      | n == m    = n
      | n > m     = m * factH' n (m + 1)
      | n < m     = error "factH: n < m"
  
-- Structural recursion is used when the recursive call is made on a substructure
-- of the original problem. For example, the length function is defined as
-- follows:

length :: [a] -> Integer
length []     = 0
length (_:xs) = 1 + Main.length xs

-- The recursive call is made on the tail of the list, which is a substructure
-- of the original list.

-- | Accumulators

-- Accumulators are used to accumulate the result of a computation. For example,
-- we can rewrite the factorial function using an accumulator:

fact1 :: Integer -> Integer
fact1 n = factH n 1
  where
    factH 0 m = m
    factH n m = factH (n - 1) (n * m)
    
-- | True and False

not :: Bool -> Bool
not n
  | n == True   = False
  | otherwise   = True

-- Or better

not :: Bool -> Bool
not True  = False
not _     = True