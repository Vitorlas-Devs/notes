#include "functions.c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 100

int main()
{
  char buffer[SIZE];
  fgets(buffer, SIZE, stdin);
  endStringAtNewline(buffer);

  int length = strlen(buffer);
  char *copy = (char *)malloc((length + 1) * sizeof(char));
  strcpy(copy, buffer);

  if (!copy)
  {
    fprintf(stderr, "Memory allocation failed\n");
    exit(1);
  }

  fprintf(stdout, "buffer: %s\n", buffer);
  fprintf(stdout, "copy: %s\n", copy);

  free(copy);

  return 0;
}