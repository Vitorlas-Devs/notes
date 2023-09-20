// this is "header guard", it prevents the header from being included more than once
#ifndef PRINTBIN_H
#define PRINTBIN_H

#include <stdio.h>
#include <limits.h>

void print_bin(unsigned int n)
{
  printf("0b");
  for (int i = sizeof(n) * 8 - 1; i >= 0; i--)
  {
    printf("%d", (n >> i) & 1);
  }
  printf("\n");
}

// this ends the header guard
#endif
