#include <stdio.h>
#include <stdbool.h>

int main()
{
  // Válasz: csak akkor használjuk a típuskonverziót
  // ha nincs "információvesztés" az egyikből a másikba
  // pl.: int (5) -> float (5.0) -> int (5)
  // rossz pl.: float (5.5) -> int (5) -> float (5.0)

  int var = 1;
  printf("%d\n", var);

  float var2 = 0.5;
  printf("%f\n", var2);

  long var3 = 123456789;
  printf("%e\n", (double)var3);

  char var4 = 'a';
  printf("%c\n", var4);

  char var5[] = "hello";
  printf("%s\n", var5);

  int* var6 = &var;
  printf("%p\n", (void *)var6);

  return 0;
}
