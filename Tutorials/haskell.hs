-- This is the Ultimate Haskell Tutorial
-- this tutorial is for programmers who are just new to haskell
-- First we intruduce each topic, then give examples right away, and then explain them in detail
-- we list usecases and best practices

-- Table of contents
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
-- 1.13 Basic type signatures
-- 1.14 Basic type inference
-- 1.15 Basic type checking
-- 1.16 Basic type errors

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

-- 1. Basics
-- 1.1 Basic types

-- There are 3 basic types in haskell: Int, Float, Bool
-- Int is an integer, Float is a floating point number, Bool is a boolean

integer :: Int -- this is a type declaration
integer = 1 -- this is a value declaration

boolean :: Bool
boolean = True

float :: Float = 1.0 -- you can do it in one line too

-- 1.2 Basic functions

-- Functions are declared like this:
functionName :: type1 -> type2 -> typeN -> returnType -> returnType
functionName arg1 arg2 argN returnVal = returnVal

-- Example:
add :: Int -> Int -> Int
add a b = a + b

-- here we have a function called 'add' that takes 2 arguments of type Int,
-- and returns a value of type Int
-- the function itself adds the 2 arguments together

-- 1.3 Basic operators