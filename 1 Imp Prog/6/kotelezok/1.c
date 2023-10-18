#include <stdio.h>

int main()
{
  int i = 1, j = 2;
  printf("i: %d, j: %d\n", i, j);

  int *pi, *pj;
  pi = &i;
  pj = &j;

  *pi = 3;

  printf("i: %d, j: %d\n", i, j);

  int **ppi;
  ppi = &pi;

  **ppi = 4;

  printf("i: %d, j: %d\n", i, j);

  *ppi = pj;
  **ppi = 5;

  printf("i: %d, j: %d\n", i, j);

  ppi = &pj;
  pj = &i;
  **ppi = 6;

  printf("i: %d, j: %d\n", i, j);

  int *****p;
  printf("%d\n", p);

  return 0;
}