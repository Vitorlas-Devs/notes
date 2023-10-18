#include <stdio.h>

int sum(int *t, int length);

int main()
{
  int t[] = {2, 4, 1, 3, 5};
  int length = sizeof(t) / sizeof(t[0]);

  printf("sum: %d\n", sum(t, length));

  return 0;
}

int sum(int *t, int length)
{
  int sum = 0;
  for (int i = 0; i < length; i++)
  {
    sum += t[i];
    // sum += *(t + i);
    // sum += i[t];
    // sum += *(i + t);
  }
  return sum;
}