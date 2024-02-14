#include <stdio.h>

int sum(int *first, int *last);
int sum2(int *first, int *last);

int main()
{
  int t[] = {2, 4, 1, 3, 5};
  int length = sizeof(t) / sizeof(t[0]);

  printf("sum: %d\n", sum(t, t + length)); // &t[length - 1] + 1
  printf("sum2: %d\n", sum2(t, t + length));

  return 0;
}

int sum(int *first, int *last)
{
  int sum = 0;
  for (int i = 0; i < last - first; i++)
  {
    sum += first[i];
  }
  return sum;
}

int sum2(int *first, int *last)
{
  int s = 0;
  while (first != last)
  {
    s += *first;
    first++;
  }
  return s;
}