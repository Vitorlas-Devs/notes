#include <stdio.h>

int *f()
{
  int a = 123;
  int *b = &a;
  return b;
}

int* g() {
  int j = 234;
  int *p = &j;
  return p;
}

int main()
{
  int *p = f();
  g();
  
  printf("%d\n", *p);

  return 0;
}