-- | Number Type Hierarchie

-- Eq: numbers that support equality operations (==, /=)
-- ├─ Ord: numbers that support ordering operations (<, >, <=, >=)
-- │  ├─ Num: numbers that support arithmetic operations (+, -, *, abs, signum, fromInteger)
-- │  │  ├─ Integral: numbers that support integer arithmetic operations (div, mod, quot, rem, toInteger)
-- │  │  │  ├─ Int: fixed-precision integers with at least the range [-2^29 .. 2^29-1]
-- │  │  │  ├─ Integer: arbitrary-precision integers (limited only by the amount of memory available)
-- │  │  │  └─ Word: fixed-precision unsigned integers with the range [0 .. 2^32-1]
-- │  │  └─ Fractional: numbers that support fractional arithmetic operations (/)
-- │  │     ├─ Floating: numbers that support transcendental functions (pi, exp, log, sin, cos, etc.)
-- │  │     │  ├─ Double: double-precision floating-point numbers
-- │  │     │  └─ Float: single-precision floating-point numbers
-- │  │     └─ Rational: numbers that are represented as ratios of two Integers
-- │  └─ Real: numbers that support conversion to Rational
-- └─ Enum: numbers that support conversion to and from Int
--    └─ Bounded: numbers that have a lower and upper bound
--       └─ Int, Integer, Word, Char, Bool

inc :: (Num a) => a -> a
inc x = x + 1

fgh :: (Num a) => a -> Bool -> Int
fgh x c = 1

-- eveN :: Int -> Bool
-- eveN :: Integer -> Bool
eveN :: (Integral a) => a -> Bool
eveN n = n `mod` 2 == 0

odD :: (Integral a) => a -> Bool
odD n = not (eveN n)

square :: (Num a) => a -> a
square x = x * x

squareinc :: Int -> Int
squareinc x = square (inc x)

-- | fromIntegral

-- This type signature is not valid, because the type of `x` is not constrained
squareinc' :: (Num a) => a -> a
squareinc' x = square (inc x)

-- Instead, we can use `fromIntegral` to convert the type of `x` to `Int`
squareinc'' :: Int -> Int
squareinc'' x = square (inc (fromIntegral x))

-- >>> squareinc 7
-- 64

-- let's think step by step how this works
-- input: x = 7

-- | Greedy evaluation:
-- squareinc 7
-- square (inc 7)
-- square (7 + 1)
-- square 8
-- 8 * 8

-- output: 64

-- | Lazy evaluation:
-- squareinc 7
-- square (inc 7)
-- (inc 7) * (inc 7)
-- (7 + 1) * (inc 7)
-- 8 * (inc 7)
-- 8 * (7 + 1)
-- 8 * 8

-- output: 64

-- | The Haskell compiler works by creating a graph of expressions, and then
-- evaluating the graph. This is called graph reduction. The graph is created
-- by replacing function calls with their definitions. This is called
-- inlining. The compiler will also perform other optimizations, such as
-- common subexpression elimination, which is the process of replacing
-- repeated expressions with a single variable.
-- By default,GHC uses lazy evaluation, but it can be configured to use greedy evaluation.

-- | Recursion: The Holy Grail of Functional Programming -Copilot

-- Factorial it is
-- 5! = 5 * 4 * 3 * 2 * 1

-- n! = n * (n-1)!
-- n! = n * (n-1) * (n-2)!
-- n! = n * (n-1) * (n-2) * ... * 1

-- Factorial works by recursively multiplying a number by the factorial of the
-- previous number, until it reaches 1.

fact :: (Integral a) => a -> a
fact n = if n > 0 then product [1 .. n] else 1

-- or with guards:
fact' :: (Ord a, Num a, Enum a) => a -> a
fact' n
  | n > 0 = product [1 .. n]
  | otherwise = 1

-- with error messages:
fact'' :: (Ord a, Integral a, Show a) => a -> a
fact'' n
  | n > 0 = product [1 .. n]
  | n == 0 = 1
  | otherwise = error ("factorial is not defined for negative numbers: " ++ show n)

-- >>> (\x -> map fact x) [-2..10]
-- [1,1,1,1,2,6,24,120,720,5040,40320,362880,3628800]

-- | The product function

-- product multiplies all the elements of a list together.

-- It is defined in the Prelude as:
product' :: (Num a) => [a] -> a
product' [] = 1
product' (x : xs) = x * product xs

-- Prelude is the standard library of Haskell, and it is imported by default

-- >>> product [1 .. 10]
-- 3628800

-- | Pattern matching

-- Pattern matching is a way of matching values against patterns and then
-- executing code based on the match. It is similar to switch statements in
-- imperative languages, but much more powerful.

-- Pattern matching is used in function definitions to define separate function
-- bodies for different patterns. It is also used in case expressions to
-- conditionally execute code based on the value of a pattern.

-- eveN 0 = True
-- eveN 1 = False
-- eveN 2 = True
-- eveN 3 = False
-- eveN 4 = True

-- Notice the pattern here: the function returns True for even numbers and
-- False for odd numbers. We can use pattern matching to define the function like this:

even' :: (Integral a) => a -> Bool
even' 0 = True
even' 1 = False
even' n = even' (n - 2)

-- >>> (\x -> map even' x) [0..4]
-- [True,False,True,False,True]

-- It's also similar to function overloading in imperative languages, but
-- instead of defining multiple functions with the same name, we define a
-- single function with multiple patterns

-- | Pattern matching in case expressions