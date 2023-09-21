#include <stdio.h>

int main()
{
  int var;

  scanf("%d", &var);

  if (var % 2 == 0)
    printf("var is even\n");
  else
    printf("var is odd\n");

  return 0;
}