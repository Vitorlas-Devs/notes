@value
@register_passable("trivial")
struct Point:
    var x: Int
    var y: Int

    fn __str__(self) -> String:
        return "Point(" + str(self.x) + ", " + str(self.y) + ")"


fn main():
    var v = List(1, 2, 3, 4, 5)

    for i in v:
        print(i[], end=" ")
    print()

    for i in range(0, v.size):
        print(v[i], end=" ")
    print()

    var points = List(Point(1, 2), Point(3, 4), Point(5, 6))

    for p in points:
        print(str(p[])) 
    print()
