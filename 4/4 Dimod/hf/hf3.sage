class LinDiofantianEq:
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c

    def is_solvable(self):
        return self.c % gcd(self.a, self.b) == 0

    def next_solution(self):
        g, s, t = xgcd(self.a, self.b)
        x_0 = s * (self.c / g)
        y_0 = t * (self.c / g)

        if x_0 > 0:
            k = 0
        else:
            k = ceil(-x_0 / (self.b / g))
                
        x = x_0 + k * (self.b / g)
        y = y_0 - k * (self.a / g)

        return x, y

    def prev_solution(self, x, y):
        ...

d = LinDiofantianEq(2, 7, 30)
print(d.next_solution())
