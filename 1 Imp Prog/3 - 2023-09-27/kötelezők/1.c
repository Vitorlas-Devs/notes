#include <stdio.h>

void printSize(char *typeName, size_t size)
{
  printf("type: %s\t\tsize: %d\n", typeName, size);
}

int main()
{
  char *types[] = {"int", "long int", "unsigned int", "unsigned long int", "char", "_Bool", "float", "double", "long double"};
  size_t sizes[] = {sizeof(int), sizeof(long int), sizeof(unsigned int), sizeof(unsigned long int), sizeof(char), sizeof(_Bool), sizeof(float), sizeof(double), sizeof(long double)};
  int numTypes = sizeof(types) / sizeof(types[0]);

  for (int i = 0; i < numTypes; i++)
  {
    printSize(types[i], sizes[i]);
  }

  return 0;
}