#include <stdio.h>
#include <stdbool.h>

bool friendly(int a, int b);

int main()
{
  int a, b;

  printf("a = ");
  scanf_s("%d", &a);

  printf("b = ");
  scanf_s("%d", &b);

  printf("Friendly: %s", friendly(a, b) ? "yes" : "no");

  return 0;
}

bool friendly(int a, int b)
{
  for (int i = 2; i < (a > b ? a : b); ++i)
  {
    if (a % i == 0 && b % i == 0)
    {
      return true;
    }
  }

  return false;
}