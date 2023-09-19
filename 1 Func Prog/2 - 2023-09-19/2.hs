-- leap year function

leapYear :: Int -> Bool
leapYear year = (year `mod` 4 == 0) && 
                (year `mod` 100 /= 0) || 
                (year `mod` 400 == 0)
