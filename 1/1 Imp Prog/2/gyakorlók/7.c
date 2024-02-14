#include <stdio.h>

int main()
{

  for (float f = 0; f <= 1; f += .1)
  {
    printf("%.1f, ", f);
  }

  return 0;
}