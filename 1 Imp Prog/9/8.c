#include <stdio.h>
#include "utils.h"

int main()
{
  f();
  f();
  f();

  int a = 123;
  int b = 654;

  printf("a = %d\nb = %d\n", a, b);

  swap(&a, &b);

  printf("-----\n");

  printf("a = %d\nb = %d\n", a, b);

  int *max_ref = max(&a, &b);
  printf("max: %d\n", *max_ref);
}

void f()
{
  static int asd = 2;
  printf("%d\n", asd);
  asd++;
}

void swap(int *a, int *b)
{
  *a ^= *b;
  *b ^= *a;
  *a ^= *b;
}

int *max(int *a, int *b)
{
  return *a > *b ? a : b;
}
