#include <stdio.h>
#include <limits.h>
#include "../../lib/utils.h"

int func(void);

int main()
{
  // legnagyobb ábrázolható egész szám:

  // int largestNumber = INT_MAX;
  // printf("%d\n", largestNumber);
  // printf("%e\n", (double)largestNumber);

  // unsigned long long absoluteLargestNumber = _UI64_MAX;
  // printf("%llu\n", absoluteLargestNumber);
  // printf("%e\n", (double)absoluteLargestNumber);

  // printf("%d\n", sizeof(int)); // 4

  // printf("%llu\n", sizeof(unsigned long long)); // 8

  printf("%d\n", func());

  return 0;
}

int func(void)
{
  int max = 0;
  unsigned long long i;

  for (i = 1; i < 8 * sizeof(int); ++i)
  {
    max <<= 1; // max = max << 1; this is a bitwise shift left
    printf("left: %llu, %d\n", i, max);
    print_bin(max);

    max |= 1; // max = max | 1; this is a bitwise OR
    printf("or: %llu, %d\n", i, max);
    print_bin(max);

    // same as:
    // max *= 2;
    // max += 1;
  }

  return max;
}
