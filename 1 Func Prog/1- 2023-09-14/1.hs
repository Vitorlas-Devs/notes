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
square :: Num a => a -> a
square x = x * x

-- pow
-- hatvány művelet nem **, hanem ^
-- Num a => a -> a -> a: két paramétert vár, és egyet ad vissza
-- A paramétereket ugyanúgy '->'-al választjuk el, mint a return értéket
pow :: Num a => a -> a -> a
pow i j = i ^ j