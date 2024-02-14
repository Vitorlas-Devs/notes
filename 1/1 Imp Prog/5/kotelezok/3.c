#include <stdio.h>
#include <limits.h>

int max(int t[], int size);

int main()
{
  int t[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
  int size = sizeof(t) / sizeof(t[0]);

  printf("Max of items is %d", max(t, size));

  return 0;
}

int max(int t[], int size)
{
  int max = INT_MIN;

  for (int i = 0; i < size; ++i)
  {
    if (t[i] > max)
    {
      max = t[i];
    }
  }

  return max;
}