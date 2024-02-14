#include <stdio.h>

int main()
{

  double cord[8] = {0.0};

  for (int i = 0; i < 8; i++)
  {
    printf("a%d = ", i + 1);
    scanf_s("%lf", &cord[i]);
  }

  // double scalar = (b1 - a1) * (d1 - c1) + (b2 - a2) * (d2 - c2);
  double scalar = (cord[2] - cord[0]) * (cord[6] - cord[4]) + (cord[3] - cord[1]) * (cord[7] - cord[5]);

  printf("The two lines are %sperpendicular.\n", scalar == 0 ? "" : "not ");

  return 0;
}