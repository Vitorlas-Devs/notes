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
        remove(dep.stock, index)

        return dep


fn remove[T: CollectionElement](owned list: List[T], index: Int) -> List[T]:
    return list[:index] + list[index + 1 :]


fn main():
    pass
