#include <stdio.h>

int main()
{
  int a, b;
  scanf_s("%d", &a);
  scanf_s("%d", &b);

  printf("%d + %d = %d\n", a, b, a + b);
  printf("%d - %d = %d\n", a, b, a - b);
  printf("%d * %d = %d\n", a, b, a * b);
  printf("%d / %d = %d\n", a, b, a / b);
  printf("%d %% %d = %d\n", a, b, a % b);

  return 0;
}