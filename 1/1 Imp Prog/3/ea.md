# 3. előadás

## Kulcsszavak

A programozási nyelvek beépített kulcsszavai (pl. `if`, `while`). Ezeket nem lehet változóként használni.

## Azonosítók

Az azonosítók a változók, függvények, osztályok, stb. nevei. Az azonosítók a következők lehetnek:

Csak:

- betűk (kis és nagy betűk között különbség van)
- számok (nem az első karakter)
- aláhúzás (`_`, ezt internal/private változókra szokták használni)

**Elnevezési konvenciók:**

- CamelCase - `egyPélda`: osztályokra, változókra, függvényekre szokták használni
- TitleCase - `EgyPélda`: osztályokra, típusokra szokták használni
- UpperCase - `EGY_PÉLDA`: konstansokra szokták használni

## Konstansok, literálok

A konstansok olyan változók, amelyek értéke nem változik a program futása során. A konstansokat általában nagybetűvel írjuk.

### Egész számok

| Megnevezés | Név | Példa | Típus | Méret (bájt) |
| ---------- | --- | ----- | ----- | ------------ |
| decimálisz egész | `int` | `42` | egész | 4 |
| oktális egész | `int` | `031` | egész | 4 |
| hexadecimális egész | `int` | `0x2A` | egész | 4 |
| hosszú egész | `long` | `42L` | egész | 8 |
| még hosszabb egész | `long long` | `42LL` | egész | 8 |
| előjel nélküli egész | `unsigned int` | `42u` | egész | 4 |
|

### Lebegőpontos számok

**Működési elv:**

- előjel (1 bit)
- mantissza (23 bit)
- kitevő (8 bit)

<div style="background-color:white;padding:10px">
  <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/dcd36557db1b343d74991d99aeb50aadce64eb3a" alt="Szám" width="300"/>
</div>

<div style="background-color:white;padding:10px">
  <img src="https://upload.wikimedia.org/wikipedia/commons/d/d2/Float_example.svg" alt="Lebegőpontos számok" width="500"/>
</div>

| Megnevezés | Név | Példa | Típus | Méret (bájt) |
| ---------- | --- | ----- | ----- | ------------ |
| lebegőpontos szám | `float` | `3.14f` | lebegőpontos | 4 |
| dupla pontosságú lebegőpontos szám | `double` | `3.14` | lebegőpontos | 8 |
| hosszú dupla pontosságú lebegőpontos szám | `long double` | `3.14L` | lebegőpontos | 16 |
|

### Egyéb számok

- `Inf` - Infinity, végtelen
- `-Inf` - negatív végtelen
- `NaN` - Not a Number, nem szám.

### Komplex számok

A komplex számokat a `complex.h` fejlécfájlban található `complex` típussal tudjuk kezelni.

| Megnevezés | Név | Példa | Típus | Méret (bájt) |
| ---------- | --- | ----- | ----- | ------------ |
| komplex szám | `complex` | `3.14i` | komplex | 8 |
| dupla pontosságú komplex szám | `double complex` | `3.14i` | komplex | 16 |
| hosszú dupla pontosságú komplex szám | `long double complex` | `3.14i` | komplex | 32 |
|

### Karakterek

| Megnevezés | Név | Példa | Típus | Méret (bájt) |
| ---------- | --- | ----- | ----- | ------------ |
| karakter | `char` | `'a'` | karakter | 1 |
| széles karakter | `wchar_t` | `L'a'` | karakter | 2 |
|

### Escape karakterek

| Karakter | Leírás |
| -------- | ------ |
| `\'` | egyszeres idézőjel |
| `\"` | dupla idézőjel |
| `\?` | kérdőjel |
| `\\` | backslash |
| `\n` | újsor |
| `\t` | tabulátor |
| `\v` | függőleges tabulátor |
| `\f` | formfeed (oldaltörés) |
| `\b` | backspace |
| `\r` | visszatérés (carriage return, Windows-on a `\n` és `\r` együtt alkotja az újsort) |
| `\a` | csengő |
| `\0` | null karakter |
| `\xhh` | hexadecimális karakter (pl. az `a` karakter hexadecimális értéke `0x61`, ezért a `\x61` ugyanazt jelenti, mint az `'a'`)
| `\ooo` | oktális karakter (pl. `\141` = `a` karakter mivel oktális értéke `0141`)
| `\uhhhh` | unicode karakter (pl. `\u0061` = `a` karakter mivel unicode értéke `0061`)
|

### Sztringek

A sztringeket a `string.h` fejlécfájlban található `string` típussal tudjuk kezelni.

Egy string egy karakterekből álló tömb, amelynek a végén van egy null karakter (`\0`).
Ezáltal a stringek indexelhetőek, és a hosszukat a `strlen` függvénnyel tudjuk lekérdezni, ami nem számolja bele a null karaktert.

A sztringeket dupla idézőjel (`"`) közé kell írni, míg a karaktereket egyszeres idézőjel (`'`) közé.

Fájlok végén az end of file (`EOF`) karakter van.

### Void

A `void` típus nem tartalmaz semmit. A `void` típusú változókat nem lehet létrehozni, csak mutatókat lehet rájuk létrehozni.

Akkor használjuk, ha nem akarunk visszatéréi értéket adni egy függvénynek.

A void pointerek (`void*`) mutathatnak bármilyen típusú változóra, ez akkor hasznos, ha nem tudjuk,
hogy milyen típusú változóra fogunk mutatni.
Viszont ez nem biztonságos, mert a fordító nem tudja, hogy milyen típusú változóra mutat a pointer,
ezért nem tudja ellenőrizni, hogy helyesen használjuk-e.
