#include <stdio.h>

int f()
{
  int asd = 2;

  if (asd == 2)
  {
    asd = 3;
    printf("Yes: %d", asd);
  }
  else
  {
    asd = 4;
    printf("Still yes: %d", asd);
  }
}

int main()
{
  f();

  return 0;
}