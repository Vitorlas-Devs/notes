import Data.Char (toUpper)
import Test.HUnit

-- | 1. feladat
time :: [(Integer, Integer)]
time = [(h, m) | h <- [0 .. 23], m <- [0 .. 59]]

time12h :: [(Integer, Integer)]
time12h = [(h, m) | h <- [0 .. 23], h < 13, m <- [0 .. 59]]

-- Tests
tests :: Test
tests = TestList [TestLabel "Test for time" testTime, TestLabel "Test for time12h" testTime12h]

testTime :: Test
testTime = TestCase (assertEqual "Should return 1440" 1440 (length time))

testTime12h :: Test
testTime12h = TestCase (assertEqual "Should return 780" 780 (length time12h))

-- Run the tests
main :: IO ()
main = runTestTT tests >>= print

-- | 2. feladat
isPrime :: Integer -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime n = null [x | x <- [2 .. n `div` 2], n `mod` x == 0]

-- >>> isPrime 7
-- True

-- | 3. feladat
prime :: [Integer]
prime = [x | x <- [10000000 ..], isPrime x]

-- >>> take 10 prime
-- [2,3,5,7,11,13,17,19,23,29]

-- | 4. feladat
allPositive :: [Int] -> Bool
-- allPositive = all (> 0)
allPositive xs = null [x | x <- xs, x <= 0]

-- >>> allPositive [1,2,3]
-- True

-- | 5. feladat
natural :: [(Integer, Integer)]
natural = [(x, y) | x <- [1 ..], y <- [1 .. x]]

-- >>> take 10 natural
-- [(1,1),(2,1),(2,2),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(4,4)]

-- | 6. feladat
dominos :: [(Integer, Integer)]
dominos = [(a, b) | a <- [0 .. 6], b <- [a .. 6]]

-- >>> dominos
-- [(0,0),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,2),(2,3),(2,4),(2,5),(2,6),(3,3),(3,4),(3,5),(3,6),(4,4),(4,5),(4,6),(5,5),(5,6),(6,6)]

-- | 7. feladat
alphabet :: [(Int, Char)]
alphabet = zip [1 ..] ['a' .. 'z']

-- >>> alphabet
-- [(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e'),(6,'f'),(7,'g'),(8,'h'),(9,'i'),(10,'j'),(11,'k'),(12,'l'),(13,'m'),(14,'n'),(15,'o'),(16,'p'),(17,'q'),(18,'r'),(19,'s'),(20,'t'),(21,'u'),(22,'v'),(23,'w'),(24,'x'),(25,'y'),(26,'z')]

pairs :: [(Integer, Integer)]
pairs = [(a, n - a) | n <- [0 ..], a <- [0 .. n]]

-- >>> take 10 pairs
-- [(0,0),(0,1),(1,0),(0,2),(1,1),(2,0),(0,3),(1,2),(2,1),(3,0)]

-- | 8. feladat
range :: Integer -> Integer -> [Integer]
range a b
  | a <= b = [a .. b]
  | a > b = [a, a - 1 .. b]

-- >>> range 6 6
-- [6]

-- >>> range 4 6
-- [4,5,6]

-- [6,5,4]
-- >>> range 6 4

-- | 9. feladat
length' :: [a] -> Int
length' = foldr (\_ -> (+) 1) 0

-- >>> length' [1, 2, 4]
-- 3

-- length'' :: [a] -> Int
-- length'' xs 