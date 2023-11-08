#include <stdio.h>

int sum(int t[], int w[], int size);

int main()
{
  int t[] = {100, 2, 0, 5, -4, 13, -100, 3, -1};
  int w[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

  int size = sizeof(t) / sizeof(t[0]);

  printf("Weighted sum of items is %d", sum(t, w, size));

  return 0;
}

int sum(int t[], int w[], int size)
{
  int sum = 0;

  for (int i = 0; i < size; ++i)
    sum += t[i] * w[i];

  return sum;
}