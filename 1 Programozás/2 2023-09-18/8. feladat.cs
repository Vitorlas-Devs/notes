### Feladat rekordra: Síkbeli pont - 8

- Írj programot amely megadja hogy egy síkbeli pont melyik síknegyedben van!
- Példa: `x=1`, `y=2` => `sn=1`

**Specifikáció:**

```py
Be: x ∈ R, y ∈ R
Ki: sn ∈ N
Ef: -
Uf: ((x >= 0 és y >= 0) -> sn = 1) and
    ((x <  0 és y >= 0) -> sn = 2) and
    ((x <  0 és y <  0) -> sn = 3) and
    ((x >= 0 és y <  0) -> sn = 4)
```

// 1. deklarálás
double x, y;
int sn;

// 2. beolvasás
Console.Write("x = ");
x = double.Parse(Console.ReadLine());

Console.Write("y = ");
y = double.Parse(Console.ReadLine());

// 3. feldolgozás
if (x >= 0) {
  if (y >= 0) sn = 1;
  else sn = 4;
} else {
  if (y >= 0) sn = 2;
  else sn = 3;
}

// 4. kiírás
Console.WriteLine($"sn = {sn}");