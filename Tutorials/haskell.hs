import Control.Concurrent

-- | This is the Ultimate Haskell Tutorial
-- this tutorial is for programmers who are just new to haskell
-- First we intruduce each topic, then give examples right away, and then explain them in detail
-- we list usecases and best practices

-- | Table of contents
-- 1. Basics
-- 1.1 Basic types
-- 1.2 Basic functions
-- 1-3 Basic operators
-- 1.4 Basic syntax
-- 1.5 Basic IO
-- 1.6 Basic modules
-- 1.7 Basic data structures
-- 1.8 Basic type classes
-- 1.9 Basic type declarations
-- 1.10 Basic type synonyms
-- 1.11 Basic type constructors
-- 1.12 Basic type variables
-- 1.13 Basic type inference
-- 1.14 Basic type checking
-- 1.15 Basic type errors

-- 2. Intermediate Haskell
-- 2.1 Function types
-- 2.2 Function definitions
-- 2.3 Function application
-- 2.4 Function composition
-- 2.5 Currying
-- 2.6 Partial application
-- 2.7 Higher order functions
-- 2.8 Lambda expressions
-- 2.9 Pattern matching
-- 2.10 Guards
-- 2.11 Where
-- 2.12 Let
-- 2.13 Case
-- 2.14 Recursion
-- 2.15 Tail recursion
-- 2.16 Accumulators
-- 2.17 Lazy evaluation
-- 2.18 Infinite lists
-- 2.19 List comprehensions
-- 2.20 Higher order list functions
-- 2.21 Map, filter, foldr, foldl
-- 2.22 Zip
-- 2.23 Unzip
-- 2.24 List ranges

-- 3 Advanced Haskell
-- 3.1 Monads
-- 3.2 Functors
-- 3.3 Applicatives
-- 3.4 Monoids

-- | 1. Basics

-- | 1.1 Basic types

-- There are 3 basic types in haskell: Int, Float, Bool
-- Int is an integer, Float is a floating point number, Bool is a boolean

integer :: Int -- this is a type declaration
integer = 1 -- this is a value declaration

boolean :: Bool
boolean = True

float :: Float = 1.0 -- you can do it in one line too

-- | 1.2 Basic functions

-- Functions are declared like this:
functionName :: type1 -> type2 -> typeN -> returnType -> returnType
functionName arg1 arg2 argN returnVal = returnVal

-- Example:
add :: Int -> Int -> Int
add a b = a + b

-- here we have a function called 'add' that takes 2 arguments of type Int,
-- and returns a value of type Int
-- the function itself adds the 2 arguments together

-- | 1.3 Basic operators

-- Basic operators: - +, -, *
-- Boolean logic: &&, ||
-- Equality: ==, /=
-- Comparison: >, <, >=, <=

-- | 1.4 Basic syntax

-- Haskell is a whitespace sensitive language, this means that you have to indent your code
-- to make it work, this is a good thing, because it makes your code more readable

-- | 1.5 Basic IO

-- IO stands for input/output, this is how you can interact with the user
-- in haskell, you can use the 'putStrLn' function to print a string to the console
-- and the 'getLine' function to get a string from the user

-- Example:
exampleIO :: IO () -- IO is the type of the main function, it is a special type
exampleIO = do -- this can be run in the ghci by typing 'main'
    putStrLn "Hello World!" -- this prints "Hello World!" to the console
    name <- getLine -- this gets a string from the user and stores it in the variable 'name'
    putStrLn ("Hello " ++ name ++ "!") -- this prints "Hello " ++ name ++ "!" to the console

-- | 1.6 Basic modules

-- Modules are like libraries, they contain functions that you can use in your code
-- you can import modules like this:
-- import Data.List -- this imports the Data.List module
-- import Data.List (sort) -- this imports the sort function from the Data.List module

-- | 1.7 Basic data structures

-- There are 3 basic data structures in haskell: lists, tuples, and records

-- Lists:
-- Lists are a collection of elements of the same type:
list :: [Int] -- this is a list of integers
list = [1, 2, 3]

-- Tuples:
-- Tuples are a collection of elements of different types:
tuple :: (Int, Bool) -- this is a tuple of an integer and a boolean
tuple = (1, True)

-- Tuples are used to return multiple values from a function:
tupleFunction :: Int -> Bool -> (Int, Bool)
tupleFunction a b = (a, b)

-- Records:
-- Records are a collection of elements of different types, but they have names:
data Record = Record { -- this is a record with 2 fields, an integer and a boolean
    recordInt :: Int,
    recordBool :: Bool
}

-- Records are used to return multiple values from a function and give them names:
recordFunction :: Int -> Bool -> Record
recordFunction a b = Record {recordInt = a, recordBool = b}

-- They can be accessed like this:
int :: Int
int = recordInt (recordFunction 1 True) -- this is 1

-- | 1.8 Basic type classes

-- Type classes are like interfaces, they are a collection of types that support certain operations
-- For example, the Num type class is a collection of types that support arithmetic operations
-- The Eq type class is a collection of types that support equality
-- The Ord type class is a collection of types that support comparison

-- Type classes are used to make functions more generic, for example:
-- the 'add' function that we defined earlier only works on integers
-- add :: Int -> Int -> Int
-- add a b = a + b
-- but we can make it work on any type that is a Num:
add' :: Num a => a -> a -> a
add' a b = a + b

-- Similarly, we can use Ord to make a function that works on any type that is Ord:
greaterThan :: Ord a => a -> a -> Bool
greaterThan a b = a > b
-- This will work with these inputs:
-- greaterThan 1 2
-- greaterThan "a" "b"
-- greaterThan True False
-- But it will not work with these inputs:
-- greaterThan [1] [2]
-- greaterThan (1, 2) (3, 4)

-- | 1.9 Basic type declarations

-- Type declarations are used to give a type a different name, and create your own types
-- For example, we can create a type that can be either a string or an integer:
data StringOrInt = String String | Int Int

-- This is a type called StringOrInt, it can be either a String or an Int
-- We can use it like this:
stringOrInt :: StringOrInt
stringOrInt = String "Hello World!" -- this is a String
-- here "String" is a type assertion, it tells the compiler that the value is a String

stringOrInt' :: StringOrInt
stringOrInt' = Int 1 -- this is an Int

-- | 1.10 Basic type synonyms

-- Type synonyms are used to give a type a different name, but they are not types themselves
-- For example, we can create a type synonym for a string:
type MyString = [Char] -- this is a list of characters

-- This is a type synonym called MyString, it is a list of characters
-- We can use it like this:
myString :: MyString
myString = "Hello World!"

-- Type synonyms are useful for making your code more readable:
-- For example, we can create a type synonym for a list of integers instead of writing [Int] every time:
type IntList = [Int]

-- or better yet, we can create a type synonym for a list of any type:
type List a = [a]

-- here 'a' is a type variable, it can be any type:
boolList :: List Bool
boolList = [True, False]

-- we could use Num to limit it to only numbers:
type NumList a = (Num a) => [a]

-- | 1.11 Basic type constructors

-- Type constructors are used to create new types from existing types
-- For example, we can create a type that is a Tuple of 2 Integers:
type IntTuple = (Int, Int)

-- This is a type constructor called IntTuple, it is a tuple of 2 integers
-- We can use it like this:
intTuple :: IntTuple
intTuple = (1, 2)

-- You can create types from any type, even complex types from the Control.Concurrent module:
type Thread = MVar ()
type Scheduler = MVar [Thread]
newtype Process = Process {processScheduler :: Scheduler}
data ProcessId = 
    Id
        { idProcess :: Process
        , idThread :: Thread
        }

data Id = 
  IntId Int
  | StringId String
  | ThreadId Thread
  | SchedulerId Scheduler
  | ProcessId ProcessId

-- the type keyword is used to create a type synonym, it can have multiple constructors
-- the newtype keyword is used to create a new type, the difference is that newtype can only have one constructor
-- the data keyword is used to create a new type, or a 'sum type', it can have multiple constructors

-- | 1.12 Basic type variables

-- Type variables are used in generic functions, they can be any type
-- For example, we can create a function that takes a list of any type and returns the first element:
head' :: [a] -> a
head' (x:_) = x
-- here 'a' is a type variable, it can be any type
-- the '_' is a wildcard, it matches anything
-- the ':' is the cons operator, it is used to add an element to the front of a list,
-- in this case, it is used to match the first element of the list

-- | 1.14 Basic type inference

-- Type inference is the process of figuring out the type of a value
-- It is done by the compiler, and it is very useful because it saves you from having to write type declarations
-- For example, we can create a function that takes a list of any number and returns the first element:
head'' :: Num a => [a] -> a
head'' (x:_) = x