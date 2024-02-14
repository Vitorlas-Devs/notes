-- Definiálj eg függvényt ami eldönti hogy egy szám páros-e vagy sem.

even' :: Int -> Bool
even' n = n `mod` 2 == 0

odd' :: Int -> Bool
odd' n = not (even' n)

divides :: Int -> Int -> Bool
divides a b = a `mod` b == 0

area :: Int -> Int -> Int
area a b = a * b