#include <stdio.h>

void printArray(int t[], int size);
void fill_zero(int t[], int size);
void fill(int t[], int size, int value);

int main()
{
  int t[10] = {0};
  int size = sizeof(t) / sizeof(t[0]);

  printArray(t, size);
  fill_zero(t, size);
  printArray(t, size);

  return 0;
}

void printArray(int t[], int size)
{
  for (int i = 0; i < size; i++)
  {
    printf("%d ", t[i]);
  }
  printf("\n");
}

void fill_zero(int t[], int size)
{
  for (int i = 0; i < size; i++)
  {
    // t[i] = 0;
    // i[t] = 0; // because it becomes *(i + t) = 0;
    *(t + i) = 0;
  }
}

void fill(int t[], int size, int value)
{
  value = value == 0 ? 0 : value;
  for (int i = 0; i < size; i++)
  {
    t[i] = value;
  }
}