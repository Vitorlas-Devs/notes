#include <stdio.h>

int main()
{
  int x, y;
  double avg;

  printf("x = ");
  scanf("%d", &x);

  printf("y = ");
  scanf("%d", &y);

  avg = (x + y) / 2.0;

  printf("%.2f\n", avg);

  return 0;
}