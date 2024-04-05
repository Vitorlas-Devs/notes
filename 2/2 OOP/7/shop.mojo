@value
struct Product:
    var name: String
    var price: Int


@value
struct Department:
    var stock: List[Product]


@value
struct Shop:
    var food: Department
    var technical: Department


@value
struct Customer:
    var list: List[String]
    var cart: List[Product]

    fn search(inout self, name: String, dep: Department, p: Product) -> Product:
        for product in dep.stock:
            if product[].name == name:
                return product[]

        return p

    fn buy(inout self, index: Int, inout dep: Department) -> Department:
        self.cart.append(dep.stock[index])
        self.cart = remove(dep.stock, index)

        return dep


fn remove[T: CollectionElement](owned li: List[T], index: Int) -> List[T]:
    var out = List[T]()

    for i in range(li.size):
        if i == index:
            i -= 1
            continue
        out[i] = li[i]

    return out


fn main():
    pass
