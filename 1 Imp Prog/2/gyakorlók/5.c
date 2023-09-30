#include <stdio.h>

int lnko(int a, int b);

int main()
{
  int a, b;

  printf("a = ");
  scanf_s("%d", &a);

  printf("b = ");
  scanf_s("%d", &b);

  printf("\nLNKO: %d", lnko(a, b));

  return 0;
}

int lnko(int a, int b)
{
  if (a == b)
    return a;
  else if (a > b)
    return lnko(a - b, b);
  else
    return lnko(a, b - a);
}