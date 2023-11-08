#include <stdio.h>
#include <stdbool.h>

bool palindrom(int x);

int main()
{
  int x;

  printf("x = ");
  scanf_s("%d", &x);

  printf("\nPalindrom: %s\n", palindrom(x) ? "true" : "false");

  return 0;
}

bool palindrom(int x)
{
  int y = 0;
  int z = x;

  while (z > 0)
  {
    y = y * 10 + z % 10;
    z /= 10;
  }
  
  return x == y;
}