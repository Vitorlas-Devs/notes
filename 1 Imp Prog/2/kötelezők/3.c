#include <stdio.h>

int main()
{
  int var;

  scanf("%d", &var);

  if (var > 0)
    printf("var is positive\n");
  else if (var < 0)
    printf("var is negative\n");
  else
    printf("var is zero\n");

  return 0;
}