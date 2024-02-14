#include <stdio.h>

int main()
{
  int a = 1;
  int b = 3;
  int c = 5;

  // bad, gives warning
  if (a < b < c)
    printf("This is %s because (a < b) < c\n", a < b < c ? "true" : "false");

  // good
  if (a < b && b < c)
    printf("This is %s because a < b && b < c\n", a < b && b < c ? "true" : "false");

  return 0;
}