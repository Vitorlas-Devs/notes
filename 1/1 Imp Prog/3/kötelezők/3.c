#include <stdio.h>

int main()
{
  unsigned int max;

  // Számold ki, hogy mekkora lehet a legnagyobb érték, amit el lehet ebben tárolni. Add értékül a változónak ezt a számot, majd egy következő utasításban adj hozzá egyet. Írd ki a megnövelt értéket.

  for (unsigned int i = 0; i < 8 * sizeof(max); i++)
  {
    max |= 1 << i;
  }

  printf("%u\n", max); // 4294967295

  max += 1;

  printf("%u\n", max); // 0

  return 0;
}