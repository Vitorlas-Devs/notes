# Var, Assume, Solve
y = var('y')
a,b,c = 2, 7, 30
assume(x, 'integer')
assume(y, 'integer')
print("Solutions: (x,y) =", solve(a*x+b*y == c, x, y))

# 1.
print("\n1.")
x, y = var('x y')
t_0 = var('t_0')
a, b, c = 47, 49, 100_000
assume(x, 'integer')
assume(y, 'integer')
assume(t_0, 'integer')
solution = solve(a*x+b*y == c, x, y)
print("(x,y) =", solution)

x_t, y_t = solution
print("x_t =", x_t)
print("y_t =", y_t)

conditions = solve([x_t>=0, y_t>=0], t_0)
print("Conditions: ", conditions)

t_min = ceil(conditions[1][0].rhs())
t_max = floor(conditions[2][0].rhs())
print("t_min =", t_min)
print("t_max =", t_max)
print("# of solutions: ", t_max - t_min + 1)

# 2.
print("\n2.")
# download
