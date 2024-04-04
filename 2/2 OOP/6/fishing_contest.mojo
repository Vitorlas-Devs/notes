@value
struct Catch(CollectionElement, Stringable):
    var time: String
    var species: String
    var length: Float32
    var weight: Int

    fn __str__(self) -> String:
        return self.time + " " + self.species + " " + self.length + " " + self.weight


@value
struct Fisherman(Stringable):
    var name: String
    var loot: List[Catch]
    var sum: Int

    fn __init__(inout self, name: String, *loot: Catch):
        self.name = name
        self.loot = List[Catch]()
        self.sum = 0

        for c in loot:
            self.add(c[])

    fn add(inout self, c: Catch):
        self.loot.append(c)

        if c.species == "carp" and c.length >= 0.5:
            self.sum += c.weight

        if self.sum > 10:
            print(self.name + " has caught more than 10 kg of carp")

    fn __str__(self) -> String:
        var res = self.name + ":\n"
        for c in self.loot:
            res += str(c[]) + "\n"
        return res


fn main():
    var c1 = Catch("12:00", "carp", 0.6, 2)
    var c2 = Catch("12:30", "pike", 0.8, 3)
    var c3 = Catch("13:00", "carp", 0.7, 3)

    var f = Fisherman("John", c1, c2, c3)
    print(f)
