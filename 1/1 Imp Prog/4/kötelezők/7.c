#include <stdio.h>

int main()
{
  int a, b; // a = 3, b = 5, a = 0011, b = 0101
  printf("a = ");
  scanf_s("%d", &a);
  printf("b = ");
  scanf_s("%d", &b);

  // a = a + b; // a = 8, b = 5
  // b = a - b; // a = 8, b = 3
  // a = a - b; // a = 5, b = 3

  // This works because of the XOR swap algorithm:
  // https://en.wikipedia.org/wiki/XOR_swap_algorithm

  a ^= b; // a = 6, b = 5, a = 0110, b = 0101
  b ^= a; // a = 6, b = 3, a = 0110, b = 0011
  a ^= b; // a = 5, b = 3, a = 0101, b = 0011

  printf("a = %d\n", a);
  printf("b = %d\n", b);

  return 0;
}