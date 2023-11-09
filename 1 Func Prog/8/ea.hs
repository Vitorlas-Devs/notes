-- | takeWhile

-- takeWhile works by applying a predicate to a list, and returning the first
-- elements that satisfy the predicate.

-- >>> takeWhile (<0) [-5..5]
-- [-5,-4,-3,-2,-1]

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' p (x : xs)
  | p x = x : takeWhile' p xs
  | otherwise = []

-- | dropWhile

-- it's the same but for drop

-- | span

-- span is a combination of takeWhile and dropWhile. It returns a tuple of two
-- lists, the first one containing the elements that satisfy the predicate, and
-- the second one containing the rest.

-- >>> span (<0) [-5..5]
-- ([-5,-4,-3,-2,-1],[0,1,2,3,4,5])

-- >>> span (<0) [1..5]
-- ([],[1,2,3,4,5])

-- | break