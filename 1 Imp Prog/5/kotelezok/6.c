#include <stdio.h>

double average(int t[], int w[], int size);

int main()
{
  int t[] = {100, 2, 0, 5, -4, 13, -100, 3, -1};
  int w[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

  int size = sizeof(t) / sizeof(t[0]);

  printf("Weighted average of items is %f", average(t, w, size));

  return 0;
}

double average(int t[], int w[], int size)
{
  double average = 0;

  for (int i = 0; i < size; ++i)
  {
    average += t[i] * w[i];
  }

  average /= size;

  return average;
}