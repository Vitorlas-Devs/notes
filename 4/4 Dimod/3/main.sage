# 1
def divides(x, y):
    return x % y == 0

print(f"2|5: {divides(5, 2)}")
print(f"3|6: {divides(6, 3)}")
  
def divides2(x, y):
    return (x/y).is_integer()

print(f"2|5: {divides2(5, 2)}")
print(f"3|6: {divides2(6, 3)}")

def divides3(x, y):
    return x // y == x / y

print(f"2|5: {divides3(5, 2)}")
print(f"3|6: {divides3(6, 3)}")

def divides4(x, y):
    return x.quo_rem(y)[1] == 0

print(f"2|5: {divides4(5, 2)}")
print(f"3|6: {divides4(6, 3)}")
  
# 2
def num_of_divisors(x):
  return len(x.divisors())

def sum_of_divisors(x):
  return sum(x.divisors())

print(f"Divisors of 6: {6.divisors()}")
print(f"Len of divisors of 6: {num_of_divisors(6)}")
print(f"Sum of divisors of 6: {sum_of_divisors(6)}")

# 3
s = {2, 3, 4, 6, 124}

def perfect_number(x):
  return set(x  for x in s if sum(x.divisors()) == 2*x)

x = 5
print(f"Perfect numbers of {x}: {perfect_number(x)}")
