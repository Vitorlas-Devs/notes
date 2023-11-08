#include <stdio.h>
#include <math.h>

void print_powers(int a, int n);

int main()
{
  int a, n;
  printf("a = ");
  scanf_s("%d", &a);

  printf("n = ");
  scanf_s("%d", &n);

  print_powers(a, n);
}

void print_powers(int a, int n)
{

  // int q = 1;

  // for (int i = 0; i <= n; i++)
  // {
  //   printf("%d^%d = %d\n", a, i, q);
  //   q *= a;
  // }

  for (int i = 0; i <= n; i++)
  {
    printf("%d^%d = %d\n", a, i, (int)pow(a, i));
  }
}
