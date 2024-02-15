#include <stdio.h>

int f(float a);

int main()
{
  f(4.2);
  
  return 0;
}

int f(float b) {
  printf("%.1f\n", b);
}