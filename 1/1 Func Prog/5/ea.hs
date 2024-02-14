-- | 5. előadás
infixl 7 `f`

f _ _ = True

fst' :: (a, b) -> a
fst' (x, _) = x

-- >>> fst' (1, 2)
-- 1

snd' :: (a, b) -> b
snd' (_, y) = y

-- >>> snd' (1, 2)
-- 2

swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

-- >>> swap (1, 2)
-- (2,1)

-- | Enum

-- This might be unexpected, but the way it works is that it takes the difference
-- between the first two elements and then uses that as the step between the rest
-- of the elements. In this case, that difference is 2.
-- >>> [1, 3..10]
-- [1,3,5,7,9]

-- >>> [False ..]
-- [False,True]

-- When using 'Float' or 'Double' as the list element type, don't expect it to
-- work like it does with integers. It chooses a sensible step (usually 1%10 of
-- the range) and then adds that repeatedly.
-- So the last element can be slightly larger than the upper limit.
-- >>> [1.5 .. 10]
-- [1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5,10.5]
