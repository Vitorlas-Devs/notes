# Feladatmegoldás lépései

- Specifikáció
- Algoritmus
- Kód

## Szekvencia

- Lépések sorozata.

Hétköznapi algoritmus: recept, útbaigazítás.

## Elágazás

- Két vagy több lehetséges út közül választás.

Hétköznapi elágazás: ügyintézés

### Feladat elágazásra: vércsoport - 1

- Írj programot amely megadja egy ember vércsoportját a génpárjai alapján!
- ++, -+ és +- az Rh-pozitív, -- az Rh-negatív vércsoportot jelent.
- Példa: `x='+'`, `y='+'` => vércsoport: `'Rh-pozitív'`

**Specifikáció:**

```py
Be: x ∈ C, y ∈ C
Ki: v ∈ S
Ef: (x = '+' or x = '-') and (y = '+' vagy y = '-')
Uf: ((x = '+' or y = '+') -> v = 'Rh-pozitív') or
    ((x = '-' and y = '-') -> v = 'Rh-negatív')
```

> **Note**
> New operator: **∈** - in
> New operator: **∉** - not in

Az utófeltételnek és a visszadott eredménynek `és`-el igaznak kell lennie.

### Feladat elágazásra: vércsoport - 2

- Írj programot amely megadja egy ember vércsoportját a génpárjai alapján (A, B, AB, 0)!
- Példa: `x='A'`, `y='B'` => vércsoport: `'AB'`

**Specifikáció:**

```py
Be: x ∈ C, y ∈ C
Ki: v ∈ S
Ef: (x = "a" or x = "b" or x = "0") and
    (y = "a" or y = "b" or y = "0")
Uf: (x = "a" and y != "b" or x != "b" and y = "a" -> v = "A")  and
    (x = "b" and y != "a" or x != "a" and y = "b" -> v = "B")  and
    (x = "a" and y = "b"  or x = "b"  and y = "a" -> v = "AB") and
    (x = "0" and y = "0"                          -> v = "0")
```

**Kód**

Egyirányú elágazás:

```cs
if (feltétel1) {
    utasítás1
} else {
    utasítás2
}
```

Többirányú elágazás:

```cs
if (feltétel1) {
    utasítás1
} else if (feltétel2) {
    utasítás2
} else {
    utasítás3
}
```

Sokirányú elágazás:

```cs
switch (változó) {
    case érték1:
        utasítás1
        break
    case érték2:
        utasítás2
        break
    default:
        utasítás3
        break
}
```

## Ciklus

- Lépések ismétlése.

Hétköznapi ciklus: mosás, főzés

### Feladat ciklusra: Legkisebb osztó - 3

- Írj programot amely megadja egy természetes szám legkisebb osztóját!
- Példa: `n=15` => `o=3`

**Specifikáció:**

```py
Be: n ∈ N
Ki: o ∈ N
Ef: n > 1
Uf: 1 < o <= n and o | n and ∀i ∈ [2..o-1]: not i | n
```

> **Note**
> New operator: **∀** - all()

### Feladat ciklusra: Legkisebb különböző osztó - 4

- Írj programot amely megadja egy természetes szám 1-től különböző legkisebb osztóját és önmagától különböző legnagyobb osztóját!
- Példa: `n=15` => `lko=3`, `lno=5`

Megjegyzés: lko * lno = n

**Specifikáció:**

```py
Be: n ∈ N
Ki: lko ∈ N, lno ∈ N
Ef: n > 1
Uf: 1 < lko <= n and lko | n and ∀i ∈ [2..lko-1]: not i | n and
    1 < lno <= n and lno | n and ∀i ∈ [2..lno-1]: not i | n and
    lko * lno = n
```

### Feladat ciklusra: Legkisebb különböző osztó (ha van) - 5

- Írj programot amely megadja egy természetes szám 1-től és önmaágától különböző legkisebb osztóját (ha van)!

**Specifikáció:**

```py
Be: n ∈ N
Ki: o ∈ N, van ∈ L
Ef: n > 1
Uf: van = ∃i ∈ [2..n-1]: i | n and
    van -> 2 <= o < n and o | n and ∀i ∈ [2..o-1]: not i | n
```

> **Note**
> New operator: **∃** - any()

### Feladat ciklusra: Osztók összege - 6

- Írj programot amely megadja egy természetes szám osztóinak összegét!
- Példa: `n=15` => `o=24`

**Specifikáció:**

```py
Be: n ∈ N
Ki: s ∈ N
Ef: n > 1
Uf: s = ∑i ∈ [1..n]: i | n
```

> **Note**
> New operator: **∑** - sum()

### Feladat ciklusra: Páratlan osztók összege - 7

- Írj programot amely megadja egy természetes szám páratlan osztóinak összegét!
- Példa: `n=15` => `o=24`

**Specifikáció:**

```py
Be: n ∈ N
Ki: s ∈ N
Ef: n > 1
Uf: s = ∑i ∈ [1..n]: i | n and i % 2 == 1
```

### Summary

| Karakter | Programnyelvi megfelelő | Leírás | Példa |
| --- | --- | --- | --- |
| ∈ | in | a halmaz eleme | 1 ∈ [1..10] |
| ∉ | not in | a halmaz nem eleme | 1 ∉ [2..10] |
| ∀ | all() | minden elemre igaz | ∀i ∈ [1..10]: i > 0 |
| ∃ | any() | legalább egy elemre igaz | ∃i ∈ [1..10]: i > 0 |
| ∑ | sum() | összegzés | ∑i ∈ [1..10]: i |
| | | | |

## Record

- Rekord típusú adatstruktúra.
- Egy rekord típusú változó több adatot tárolhat.

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

### Specifikációbeli jelölés

- egy adat
  - x ∈ R
- adattöbbes
  - p ∈ Pont, Pont = X × Y, X = R, Y = R
  - ×: Descartes-szorzat: felsorolja az összes lehetséges párt
  - hivatkozás a nevükkel
    - p.x (p pont x koordinátája)
    - p.y (p pont y koordinátája)

### Feladat rekordra átalakítva: Síkbeli pont - 9

- Írj programot amely megadja hogy egy síkbeli pont melyik síknegyedben van!
- Használj rekord típust!
- Példa: `x=1`, `y=2` => `sn=1`

**Specifikáció:**

```py
Be: p ∈ Pont
Ki: sn ∈ N
Ef: -
Uf: ((p.x >= 0 és p.y >= 0) -> sn = 1) and
    ((p.x <  0 és p.y >= 0) -> sn = 2) and
    ((p.x <  0 és p.y <  0) -> sn = 3) and
    ((p.x >= 0 és p.y <  0) -> sn = 4)
```

***Kód***

Struktúra definíció:

```cs
struct Pont {
    public double x, y;
}
```

Struktúra példányosítás:

```cs
Pont p = new Pont();
```

## Tömb

- Több azonos típusú adat tárolása.

### Specifikáció

- `teendők ∈ S[1..5]`: Összes lehetséges 5 elemű szövegből álló sorozat halmaza
- `teendők[1]`: Az első elem a teendők tömbben

### Feladat tömbre: Japán naptár - 10

- Írj programot amely megadja egy M évről (1984<=M<=2043) hogy milyen színű (a japán naptár szerint)!
- Japán naptár: 60 éves ciklus, 10 szín, 12 elemű ciklus
- Példa: `m=2021` => `s='fehér'`

**Specifikáció:**

```py
Be: év ∈ N
Ki: s ∈ Szín
    Szín = { 'zöld', 'piros', 'sárga', 'fehér', 'fekete' }
Ef: 1984 <= év <= 2043
Uf: y = ((év - 1984) mod 10 ) div 2 and
    y = 0 -> s = "zöld"  and
    y = 1 -> s = "piros" and
    y = 2 -> s = "sárga" and
    y = 3 -> s = "fehér" and
    y = 4 -> s = "fekete"
```

***Kód***

Szín típus:

```cs
enum Szín { zöld, piros, sárga, fehér, fekete }
```

Tömb definíció:

```cs
string[] színek = { "zöld", "piros", "sárga", "fehér", "fekete" };
```

Tömb példányosítás:

```cs
string[] színek = new string[5];
```

Tömb elem hozzáférés:

```cs
színek[0] = "zöld";
színek[1] = "piros";
```
