-- Ord type

inR :: Ord a => a -> a -> a -> Bool
inR min max x = x >= min && x <= max

-- The Ord type class is for types that have an ordering.
-- They support the operators <, >, <=, >=, max, min.
-- The Ord type class is a subclass of the Eq type class.

-- Let and In

inRR :: Ord p => p -> p -> p -> Bool
inRR min max x = 
  let ilb = x >= min
      iub = x <= max
  in ilb && iub

-- The 'let' expression is used to define local variables.
-- The 'in' expression is used to define the body of the let expression.

-- Where

inR3 :: Ord p => p -> p -> p -> Bool
inR3 min max x = ilb && iub
  where ilb = x >= min
        iub = x <= max

-- The 'where' clause is used to define local variables.
-- After the 'where' clause, the local variables are in scope.

-- If, Then, Else

inR4 :: Ord p => p -> p -> p -> Bool
inR4 min max x = if ilb then iub else False
  where ilb = x >= min
        iub = x <= max

-- Guards

inR5 :: Ord p => p -> p -> p -> Bool
inR5 min max x
  | ilb && iub = True
  | otherwise = False
  where ilb = x >= min
        iub = x <= max

-- The 'otherwise' guard is always true.

-- Factorial

fact1 :: Integer -> Integer
fact1 n = if n <= 1 then 1 else n * fact1 (n - 1)

fact2 :: Integer -> Integer
fact2 n
  | n <= 1 = 1
  | otherwise = n * fact2 (n - 1)

fact3 :: Integer -> Integer
fact3 n
  | n <= 1 = 1
  | True = n * fact3 (n - 1)

-- Tail Recursion

recf :: (Ord t, Num t) => t -> t -> t
recf n acc
  | n <= 1 = acc
  | otherwise = recf (n - 1) (n * acc)

-- The accumulator is used to store the result of the recursive call.
-- The accumulator is passed as an argument to the recursive call.
-- This version of factorial is tail recursive, because the recursive call is the last thing that happens.