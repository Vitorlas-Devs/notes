-- | Int vs Integer

-- Int: 32-bit (4 bytes) integer, this means that it can be as big as 2^32
-- Integer: unbounded integer, this means that it can be as big as your memory can hold

-- Int is faster than Integer, but Integer is more flexible

inc :: Int -> Int
inc x = x + 1

inc' :: Integer -> Integer
inc' x = x + 1

-- | Double vs Float

-- Float: 32-bit (4 bytes) floating point number
-- Double: 64-bit (8 bytes) floating point number

divide :: Float -> Float -> Float
divide x y = x / y

divide' :: Double -> Double -> Double
divide' x y = x / y

-- | Fractional

-- Fractional is a typeclass, it is a collection of types that support division
-- Fractional is a superclass of Float and Double

divide'' :: Fractional a => a -> a -> a
divide'' x y = x / y

-- ":t (/)" in ghci will tell you the type of the division operator
-- you can see that Fractional supports division

-- | Num

-- Num is a typeclass, it is a collection of types that support arithmetic operations
-- Num is a superclass of Int, Integer, Float, Double

f :: forall a. (Num a, Ord a) => Bool -> a -> Bool
f True x = x > 0
f False x = x < 0

-- forall is a keyword that allows you to specify type variables
-- in this case, we are saying that f is a function that takes a type a. that is a Num and Ord (ordered, supports comparison)
-- and returns a function that takes a Bool and a value of type a and returns a Bool

-- In GHCI, you can use the :t command to see the type of a value

-- | Show and Read

-- Show is a typeclass, it is a collection of types that can be converted to a string
-- Show is a superclass of Int, Integer, Float, Double, Bool, Char, String

-- show will convert a value to a string
show' :: Show a => a -> String
show' x = show x

-- Read is a similar typeclass, it is a collection of types that can be converted from a string

-- read will convert a string to a value
read' :: Read a => String -> a
read' x = read x

-- We can use Maybe to handle errors
-- Maybe is a type that can be either Just a value or Nothing

-- there is a showMaybe function that will convert a Maybe to a string
-- and a readMaybe function that will convert a string to a Maybe
showMaybe :: Show a => Maybe a -> String
showMaybe Nothing = "Nothing"
showMaybe (Just x) = "Just " ++ show x
