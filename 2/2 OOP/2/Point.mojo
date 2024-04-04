from math import sqrt


@value
struct Point(Stringable):
    var x: Float32
    var y: Float32

    fn __init__(inout self):
        self.x = 0
        self.y = 0

    fn __str__(self) -> String:
        return "Point(x: " + str(self.x) + ", y: " + str(self.y) + ")"

    @staticmethod
    fn distance(p1: Point, p2: Point) -> Float32:
        return sqrt((p1.x - p2.x) ** 2 + (p1.y - p2.y) ** 2)


@value
struct Circle(Stringable):
    var p: Point
    var r: Float32

    fn __init__(inout self, p: Point, r: Float32) raises:
        if r < 0:
            raise Error("Radius must be non-negative")

        self.p = p
        self.r = r

    fn __str__(self) -> String:
        return "Circle(p: " + str(self.p) + ", r: " + str(self.r) + ")"

    fn contains(self, p: Point) -> Bool:
        return Point.distance(self.p, p) <= self.r


fn main() raises:
    var p = Point(1, 2)
    print(p)

    var c = Circle(p, 3)
    print(c)

    var p2 = Point(1, 3)
    print(c.contains(p2))
