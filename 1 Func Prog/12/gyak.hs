import Data.List
import Data.Ord

-- | 1. feladat
data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving (Eq, Show, Ord, Read)


-- >>> Mon < Tue
-- True

-- >>> Mon > Tue
-- False

-- >>> Mon == Mon
-- True

-- | 2. feladat
isFirstDayOfWeek :: Day -> Bool
isFirstDayOfWeek Mon = True
isFirstDayOfWeek _ = False

-- >>> isFirstDayOfWeek Mon
-- True

-- >>> isFirstDayOfWeek Fri
-- False

-- | 3. feladat
isWeekend :: Day -> Bool
isWeekend Sat = True
isWeekend Sun = True
isWeekend _ = False

-- >>> isWeekend Mon
-- False

-- >>> isWeekend Sat
-- True

-- | 4. feladat
data Time
  = Time
      { hours :: Int,
        mins :: Int
      }
  | LongTime
      { hours :: Int,
        mins :: Int,
        secs :: Int
      }
  deriving (Eq, Ord, Read)

-- >>> Time 12 30
-- Time {hours = 12, mins = 30}

-- >>> hours (Time 12 30)
-- 12

-- >>> LongTime 12 30 15
-- LongTime {hours = 12, mins = 30, secs = 15}

-- >>> secs (LongTime 12 30 15)
-- 15

-- | 5. feladat
instance Show Time where
  show :: Time -> String
  show (Time h m) = show h ++ "." ++ show m
  show (LongTime h m s) = show h ++ "." ++ show m ++ "." ++ show s

-- >>> sort [Time 12 30, Time 12 15, Time 11 30]
-- [11.30,12.30,12.15]

showTime :: Time -> String
showTime (Time h m) = show h ++ "." ++ show m

-- >>> show (Time 12 15)
-- "12.15"

-- >>> showTime (Time 12 5)
-- "12.5"

-- >>> showTime (Time 9 5)
-- "9.5"

-- | 6. feladat
data Tree
  = Leaf Int
  | Node Tree Tree
  deriving (Eq, Ord, Read)

instance Show Tree where
  show :: Tree -> String
  show (Leaf n) = show n
  show (Node l r) = "(" ++ show l ++ " " ++ show r ++ ")"

-- >>> Leaf 5
-- 5

-- >>> Node (Leaf 5) (Leaf 6)
-- (5 6)

-- >>> Node (Node (Leaf 5) (Leaf 6)) (Leaf 7)
-- ((5 6) 7)

-- >>> Node (Node (Node (Leaf 5) (Leaf 6)) (Leaf 7)) (Leaf 8)
-- (((5 6) 7) 8)

-- | 7. feladat
isEarlier :: Time -> Time -> Bool
isEarlier (Time h1 m1) (Time h2 m2) = h1 < h2 || (h1 == h2 && m1 < m2)

-- >>> isEarlier (Time 12 30) (Time 12 45)
-- True

-- | 8. feladat
isBetween :: Time -> Time -> Time -> Bool
isBetween t1 t2 t3 = isEarlier t1 t2 && isEarlier t2 t3

-- >>> isBetween (Time 12 30) (Time 12 45) (Time 13 0)
-- True

-- >>> isBetween (Time 12 30) (Time 12 45) (Time 12 0)
-- False

-- | 9. feladat
