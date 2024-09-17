# Statikus típusrendszerek

- **Statikus típusrendszerek:** Compile time-nál "befagyasztjuk" a típusokat, így a futás során nem kell ellenőrizni a típusokat, pl. C, C++, Java, C#, Rust, TypeScript, Haskell, Go
- **Dinamikus típusrendszerekben** a típusokat futás közben ellenőrizzük, így azok előtte nem ismertek, pl. PHP, JavaScript
- **Dinamikus, de erősen típusos:** Python, has one type: python object

## A C programok szerkezete

```c
/*
 * A C programok szerkezete
 */

// Preprocesszor direktívák
#include <stdio.h>

// Függvénydeklarációk
int main(void);

// Függvénydefiníciók
int main(void) {
    printf("Hello, world!\n");
    return 0;
}
```
