#include <stdio.h>
#include <stdlib.h>

int *findDividers(int num, int *size);

int main()
{
  int input;
  int size;

  scanf_s("%d", &input);

  int *dividers = findDividers(input, &size);

  printf("%d's dividers: ", input);
  for (int i = 0; i < size; i++)
  {
    printf("%d, ", dividers[i]);
  }

  free(dividers);

  return 0;
}

int *findDividers(int num, int *size)
{
  int *dividers = malloc(num * sizeof(int));
  int index = 0;

  for (int i = 1; i <= num; i++)
  {
    if (num % i == 0)
    {
      dividers[index] = i;
      index++;
    }
  }

  *size = index;

  return dividers;
}