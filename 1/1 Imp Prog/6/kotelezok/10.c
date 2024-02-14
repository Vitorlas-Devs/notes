#include <stdio.h>

int *minp(int *f, int *s);

int main()
{
  int t[] = {1, 2, 3, 4, 5, 6};

  printf("min index in t value: %d\n", *minp(t + 2, t + 4));
  printf("min index in t: %ld\n", minp(t + 2, t + 4) - t);

  printf("min pointer: %p\n", (void *)minp(t + 2, t + 4));
  printf("first pointer: %p\n", (void *)t);

  return 0;
}

int *minp(int *f, int *s)
{
  if (f < s)
  {
    return f;
  }
  else
  {
    return s;
  }
}