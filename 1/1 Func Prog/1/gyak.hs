-- increment function
-- nincsenek zárójelek, nincs ;, nincs return -> szóközt használunk
inc x = x + 1
-- inc: azonosító
-- x: formális paraméter (argumentum)
-- x + 1: függvénytörzs

-- square
square :: Int -> Int
square x = x * x

-- type can be both Int and Num a, 
-- the difference is that Int is a concrete type,
-- while Num a is a type variable that includes all numeric types like Int, Float, Double, etc.
-- 'a' is a type variable

-- Polymporphism: the same function can be used with different types.
-- Int and Integer are the same, but Integer is not bounded, while Int is bounded, which means that it has a maximum and minimum value.
-- square :: Num a => a -> a
-- square x = x * x

-- pow
-- hatvány művelet nem **, hanem ^
-- Num a => a -> a -> a: két paramétert vár, és egyet ad vissza
-- A paramétereket ugyanúgy '->'-al választjuk el, mint a return értéket
pow :: (Num a, Integral a) => a -> a -> a
pow i j = i ^ j

-- leap year function

leapYear :: Int -> Bool
leapYear year = (year `mod` 4 == 0) && 
                (year `mod` 100 /= 0) || 
                (year `mod` 400 == 0)

-- Num typeclass
tst :: Num a => a -> a
tst a = a + 1

-- We can call functions like this:

inc2 :: Int -> Int
inc2 a = inc (inc a)

-- Infix, prefix, and postfix

-- Infix
-- this is useful when we want to use operators as functions

inc' :: Int -> Int
inc' a = (+) a 1

divs' :: Int -> Int
divs' a = div a 2

-- Prefix
-- this is useful when we want to use functions as operators

divs :: Int -> Int
divs a = a `div` 2

-- Recursion

-- sum of a list of numbers
sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- same as above, but with foldr
sum'' :: Num a => [a] -> a
sum'' = foldr (+) 0

-- sum of all numers from 1 to n
sum2 :: (Eq n, Num n) => n -> n
sum2 0 = 0
sum2 n = n + sum2 (n - 1)
