

# This file was *autogenerated* from the file gcd.sage
from sage.all_cmdline import *   # import sage library

_sage_const_1280 = Integer(1280); _sage_const_942 = Integer(942); _sage_const_1260 = Integer(1260); _sage_const_1 = Integer(1); _sage_const_12 = Integer(12); _sage_const_18 = Integer(18); _sage_const_0 = Integer(0); _sage_const_50 = Integer(50); _sage_const_20 = Integer(20)
import time

# GCD
print(gcd(_sage_const_1280 , _sage_const_942 ))

# Factor
print(factor(_sage_const_1260 ))

for i in factor(_sage_const_1260 ):
    print(i)

# GCD
def lnko(a, b):
    result = _sage_const_1 
    for n1, e1 in factor(a):
        for n2, e2 in factor(b):
            if n1 == n2:
                result *= n1 ** min(e1, e2)
    return result

print(lnko(_sage_const_1280 , _sage_const_942 ))

# LCM
print(lcm(_sage_const_12 , _sage_const_18 ))

def lkkt(a, b):
    result = _sage_const_1 
    for n1, e1 in factor(a):
        for n2, e2 in factor(b):
            if n1 == n2:
                result *= n1 ** max(e1, e2)
    for n, e in factor(a):
        if result % n != _sage_const_0 :
            result *= n ** e
    for n, e in factor(b):
        if result % n != _sage_const_0 :
            result *= n ** e
    return result

print(lkkt(_sage_const_12 , _sage_const_18 ))

# Euclidean algorithm
def gcd_factor(a, b):
    return gcd(a, b)

def gcd_euclidean(a, b):
    q, r = a // b, a % b
    while r != _sage_const_0 :
        a, b = b, r
        q, r = a // b, a % b
    return b

# Extended Euclidean algorithm
print(xgcd(_sage_const_50 , _sage_const_20 ))

def extended_euclidean(a, b):
    x0, y0, r0 = _sage_const_1 , _sage_const_0 , a
    x1, y1, r1 = _sage_const_0 , _sage_const_1 , b
    while r1 != _sage_const_0 :
        q = r0 // r1
        r0, r1 = r1, r0 - q * r1
        x0, x1 = x1, x0 - q * x1
        y0, y1 = y1, y0 - q * y1
    return r0, x0, y0

print(extended_euclidean(_sage_const_50 , _sage_const_20 ))

