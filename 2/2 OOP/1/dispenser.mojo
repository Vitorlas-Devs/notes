from math import math

struct SoapDispenser(Stringable):
    var current: UInt16
    var capacity: UInt16
    var drop: UInt16

    fn __init__(inout self, capacity: UInt16, drop: UInt16):
        self.capacity = self.current = capacity
        self.drop = drop

    fn push(inout self):
        self.current = math.max(0, self.current - self.drop)
        print(" -> " + str(self.drop))

    fn refill(inout self):
        self.current = self.capacity

    fn __str__(self) -> String:
        return "SoapDispenser [" + str(self.current) + " / " + self.capacity + " ]"


fn main():
    var dp = SoapDispenser(40, 2)

    print(dp)

    dp.push()
    dp.push()
    dp.push()

    print(dp)

    dp.refill()

    print(dp)
