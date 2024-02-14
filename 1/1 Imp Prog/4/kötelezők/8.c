#include <stdio.h>

int main()
{
  int x;

  printf("x = ");
  scanf_s("%d", &x);

  int result = ~x;

  printf("result = %d\n", result);

  return 0;
}