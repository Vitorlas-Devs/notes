# Memóriakezelés, tömbök és pointerek

C nyelvnek nincs Garbage Collector-je.

- A változók memóriáját a compiler kezeli a stack-en, és a változók élettartama a blokkokon belül van.
- A tömbök memóriáját a programozó manuálisan kezeli a heap-en
- A pointerek változók a stacken és memória címeket tárolnak, a heap memóriára mutatnak

## Tömbök

A tömbök a memória egy részét foglalják le, és a tömbök mérete a fordítási időben ismert. A tömbök mérete nem változhat futási időben.

```c
int a[10];
```

Többdimenziós tömbök is léteznek, de ezeket a tömböket a memóriában egydimenziós tömbként tárolja a compiler.

```c
int a[10][10];
```

A tömbök méretét a `sizeof` operátorral lehet lekérdezni.

```c
int a[10];

int size = sizeof(a); // 40
```

A tömbök hosszát is hasonló módon számolhatjuk ki.

```c
int a[10];

int length = sizeof(a) / sizeof(a[0]); // 10
```

## Pointerek

A pointerek változók a stacken, és memória címeket tárolnak. A pointerek a heap memóriára mutatnak.

```c
int a = 10;
int *p = &a; // p is a pointer (denoted by the *), and &a is the address of a
```

A pointerek dereferálásával  (`*` operátor) a heap memóriában lévő értéket tudjuk elérni.

```c
int a = 10;
int *p = &a;

int b = *p; // b = 10

// int c = &a; // error: incompatible types when initializing type 'int' using type 'int *'; dereferencing pointer to incomplete type 'int'
int c = *&a; // c = 10
```

### Null pointer

A null pointer egy olyan pointer, ami nem mutat sehova. A null pointert a `NULL` makróval lehet létrehozni.

```c
int *p = NULL;
```

Ez hasznos lehet ha egy függvény nem tudja megmondani, hogy milyen memóriaterületet foglaljon le, és ezt a függvénytől várja el a programozó.

```c

int *find(int w) {
    for (int i = 0; i < 5; i++) {
        if (t[i] == w) {
            return &t[i];
        }
    }
    return NULL;
}

int main() {
    int t[] = {1, 2, 3, 4, 5};
    int *p = find(3);

    if (p != NULL) {
        printf("%d\n", *p);
    }
}
```

C-ben függvényeknek nem tudunk csak úgy tömböket átadni, ezért pointereket kell amik tömbökre mutatnak.

```c
void print(int *t, int length) {
    for (int i = 0; i < length; i++) {
        printf("%d ", t[i]);
    }
    printf("\n");
}

int main() {
    int t[] = {1, 2, 3, 4, 5};
    print(t, 5);
}
```

### Pointerek növelése

A pointerek növelésével a pointer a memóriában következő elemre mutat.

```c
int a[] = {1, 2, 3, 4, 5};
int *p = &a[0];

printf("%d\n", *p); // 1
p++;
printf("%d\n", *p); // 2
```

Példa

```c
char *strlen2(const char *s) {
    const char *p = s;

    while (*p != '\0') {
        p++;
    }

    return p - s;
}

char *strlen(const char *s) {
    const char *p = s;

    while ( ++*s != '\0' );
    return s - p;
}
```
