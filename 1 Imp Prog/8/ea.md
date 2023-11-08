# Deklarációk, láthatóság, élettartam

## Note

To generate a position for a matrix, we can use this:

```c
#include <stdlib.h>
#include <time.h>

#define MAX_COLS 10
#define MAX_ROWS 10

const int TABLE[MAX_ROWS][MAX_COLS];

int main() {
    srand(time(NULL));

    int n = rand() % (MAX_ROWS * MAX_COLS);

    TABLE[n / MAX_COLS][n % MAX_COLS] = 1;
}
```

## Deklaráció, definíció

Deklaráció: A fordító számára megmondjuk, hogy létezik egy változó, függvény, stb.

pl.:

```c
int a;
int b;
int c;
```

Definíció: A fordító számára megmondjuk, hogy létezik egy változó, függvény, stb. és lefoglalunk neki memóriát.

*itt ugyanaz*

### Keywords

special keywords: `extern`, `static`

#### Extern

```c
extern int a;
```

A fordító számára megmondjuk, hogy létezik egy változó, de nem foglalunk neki memóriát (valahol máshol már lefoglaltuk).

#### Static

```c
static int a;
```

A fordító számára megmondjuk, hogy létezik egy változó, és lefoglalunk neki memóriát. A változó élettartama a program futásának idejéig tart.

Ha egy globális változót vagy függvényt `static` kulcsszóval jelölünk, akkor az csak a fájlban lesz látható.
