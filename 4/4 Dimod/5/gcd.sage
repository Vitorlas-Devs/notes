import time

# GCD
print(gcd(1280, 942))

# Factor
print(factor(1260))

for i in factor(1260):
    print(i)

# GCD
def lnko(a, b):
    result = 1
    for n1, e1 in factor(a):
        for n2, e2 in factor(b):
            if n1 == n2:
                result *= n1 ^ min(e1, e2)
    return result

print(lnko(1280, 942))

# LCM
print(lcm(12, 18))

def lkkt(a, b):
    result = 1
    for n1, e1 in factor(a):
        for n2, e2 in factor(b):
            if n1 == n2:
                result *= n1 ^ max(e1, e2)
    for n, e in factor(a):
        if result % n != 0:
            result *= n ^ e
    for n, e in factor(b):
        if result % n != 0:
            result *= n ^ e
    return result

print(lkkt(12, 18))

# Euclidean algorithm
def gcd_factor(a, b):
    return gcd(a, b)

def gcd_euclidean(a, b):
    q, r = a // b, a % b
    while r != 0:
        a, b = b, r
        q, r = a // b, a % b
    return b

# Extended Euclidean algorithm
print(xgcd(50, 20))

def extended_euclidean(a, b):
    x0, y0, r0 = 1, 0, a
    x1, y1, r1 = 0, 1, b
    while r1 != 0:
        q = r0 // r1
        r0, r1 = r1, r0 - q * r1
        x0, x1 = x1, x0 - q * x1
        y0, y1 = y1, y0 - q * y1
    return r0, x0, y0

print(extended_euclidean(50, 20))
