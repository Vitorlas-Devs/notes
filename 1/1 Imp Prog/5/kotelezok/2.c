#include <stdio.h>

int sum(int t[], int size);

int main()
{
  int t[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
  int size = sizeof(t) / sizeof(t[0]);

  printf("Sum of items is %d", sum(t, size));

  return 0;
}

int sum(int t[], int size)
{
  int sum = 0;

  for (int i = 0; i < size; ++i)
    sum += t[i];

  return sum;
}