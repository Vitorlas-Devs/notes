def linear_congruence_solutions(a, b, m, low, high):
    if low > high:
        raise ValueError()
    
    if b % gcd(a, m) != 0:
        raise ValueError()
    

    x = b / a

    if low < x < high:
        return x

print(linear_congruence_solutions(10, 12, 6, 10, 100))
