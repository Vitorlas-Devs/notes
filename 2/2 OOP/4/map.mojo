@value
@register_passable("trivial")
struct Item(CollectionElement):
    var key: Int
    var value: Pointer[String]

@value
struct Map:
    var seq: List[Item]

    fn clear(inout self):
        self.seq.clear()

    fn count(self) -> Int:
        return self.seq.size

    fn insert(inout self):
        pass
