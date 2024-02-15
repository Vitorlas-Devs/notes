-- | Data types
data Day
  = Mon
  | Tue
  | Wed
  | Thu
  | Fri
  | Sat
  | Sun
  deriving (Show)

isWeekDay :: Day -> Bool
isWeekDay Sat = False
isWeekDay Sun = False
isWeekDay _ = True

-- >>> isWeekDay Mon
-- True

data Calc
  = Add Int Int
  | Sub Int Int
  | Mul Int Int
  | Div Int Int

calc :: Calc -> Int
calc (Add a b) = a + b
calc (Sub a b) = a - b
calc (Mul a b) = a * b
calc (Div a b) = a `div` b

-- >>> calc (Add 1 2)
-- 3

-- >>> calc (Div 10 2)
-- 5

data Point = Point Double Double
  deriving (Show)

distance :: Point -> Point -> Double
distance (Point x1 y1) (Point x2 y2) =
  sqrt ((x1 - x2) ^ 2 + (y1 - y2) ^ 2)

-- >>> distance (Point 1 2) (Point 3 4)
-- 2.8284271247461903

data Pt a = Pt a a
  deriving (Show)

create' :: Int -> Int -> Pt Int
create' = Pt

-- >>> create' 1 2
-- Pt 1 2

-- | Maybe, Just, Nothing
data Mb a = Just' a | Nothing'
  deriving (Show)

headS :: [a] -> Mb a
headS [] = Nothing'
headS (x : _) = Just' x

-- >>> headS [1, 2, 3]
-- Just' 1

-- >>> head [1, 2, 3]
-- 1

-- >>> headS []
-- Nothing'

-- >>> head []
-- Prelude.head: empty list

-- | Either, Left, Right
data Either' a b = Left' a | Right' b
  deriving (Show)

tailS :: [a] -> Either' String [a]
tailS [] = Left' "Empty list"
tailS (_ : xs) = Right' xs

-- >>> tailS [1, 2, 3]
-- Right' [2,3]

-- >>> tail [1, 2, 3]
-- [2,3]

-- >>> tailS []
-- Left' "Empty list"

-- >>> tail []
-- Prelude.tail: empty list

-- | Named fields
data Person = Person
  { name :: String,
    age :: Int,
    height :: Double
  }
  deriving (Show)

-- >>> Person "John" 20 1.8
-- Person {name = "John", age = 20, height = 1.8}

-- >>> name (Person "John" 20 1.8)
-- "John"

data Product = Product
  { productName :: String,
    number :: Int,
    value :: Int
  }
  deriving (Show)

-- >>> Product "Laptop" 3 1000
-- Product {productName = "Laptop", number = 3, value = 1000}

-- >>> productName (Product "Laptop" 3 1000)
-- "Laptop"

getPrice :: Product -> Int
getPrice (Product _ n v) = n * v

-- >>> getPrice (Product "Laptop" 3 1000)
-- 3000

getName :: Product -> String
getName = productName

-- >>> getName (Product "Laptop" 3 1000)
-- "Laptop"

getName' :: Product -> String
getName' (Product n _ _) = n

-- >>> getName' (Product "Laptop" 3 1000)
-- "Laptop"

instance Eq Product where
  (==) :: Product -> Product -> Bool
  (==) (Product _ n1 v1) (Product _ n2 v2) =
    n1 * v1 == n2 * v2

-- >>> Product "Laptop" 3 1000 == Product "Laptop" 3 1000
-- True

-- | Types
type Name = String

type Sp = String -> String

-- >>> :t ("John" :: Name)
-- ("John" :: Name) :: Name

-- >>> :t ("John" :: String)
-- ("John" :: String) :: String

getName'' :: Product -> Name
getName'' (Product n _ _) = n

getSp :: Sp -> String -> String
getSp f = f

-- >>> getSp ("John " ++) "Doe"
-- "John Doe"

(+++) :: [a] -> [a] -> [a]
(+++) xs yx = xs ++ yx

-- >>> [1, 2, 3] +++ [4, 5, 6]
-- [1,2,3,4,5,6]
