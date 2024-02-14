#include <stdio.h>

// create an empty chess board
int main()
{
  for (int y = 0; y <= 8; ++y)
  {
    for (int x = 0; x <= 8; ++x)
    {
      if (x == 0 && y == 0)
        printf("  ");
      else if (x == 0)
        printf("%d ", y);
      else if (y == 0)
        printf("%d ", x);
      else
      {
        if ((x + y) % 2 == 0)
          printf("[]");
        else
          printf("  ");
      }
    }
    printf("\n");
  }

  return 0;
}