#include <stdio.h>

long int sum(int n);

int main()
{
  int n;
  printf("n = ");
  scanf_s("%d", &n);

  printf("%d\n", sum(n));
}

long int sum(int n)
{
  long int s = 0;
  for (int i = 1; i <= n; i++)
  {
    s += i;
  }
  return s;
}
