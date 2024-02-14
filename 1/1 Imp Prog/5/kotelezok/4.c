#include <stdio.h>
#include <limits.h>

int max2(int t[], int size);

int main()
{
  int t[] = {100, 2, 0, 5, -4, 13, -100, 3, -1};
  int size = sizeof(t) / sizeof(t[0]);

  printf("The second biggest item is %d", max2(t, size));

  return 0;
}

int max2(int t[], int size)
{
  int max = INT_MIN, max2 = INT_MIN;

  for (int i = 0; i < size; ++i)
  {
    if (t[i] > max)
    {
      max2 = max;
      max = t[i];
    }
    else if (t[i] > max2)
    {
      max2 = t[i];
    }
  }

  return max2;
}