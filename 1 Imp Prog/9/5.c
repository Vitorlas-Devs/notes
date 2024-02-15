#include <stdio.h>

int main()
{
  int c = 3;

  {
    int b = 2;
    {
      int a = 1;
      b = 2;
      c = 3;
    }
    a = 4; // NO
    b = 5;
    c = 6;
  }

  a = 7; // NO
  b = 8; // NO
  c = 9;

  return 0;
}