from math import math

@value
struct Element(CollectionElement):
    var data: String
    var count: Int

    fn __add__(self, other: Element) -> Element:
        if self.data == other.data:
            return Element(self.data, self.count + other.count)
        else:
            return self

    fn __str__(self) -> String:
        return "(" + self.data + ":" + str(self.count) + ")"


@value
struct Bag:
    var seq: List[Element]

    fn max(self) -> Int:
        var max = 0
        for e in self.seq:
            if e[].count > max:
                max = e[].count
        return max

    fn log_search(self, e: String) -> Int:
        var l = 0
        var r = len(self.seq)
        while l < r:
            var m = math.round((l + r) / 2).to_int()
            if compare(self.seq[m].data, e) < 0:
                l = m + 1
            else:
                r = m
        return l


fn compare(a: String, b: String) -> Int:
    for i in range(math.min(len(a), len(b))):
        if a[i] != b[i]:
            return ord(a[i]) - ord(b[i])
    return len(a) - len(b)


fn main():
    print("asd")
