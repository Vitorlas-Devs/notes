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

  reverse(buffer);

  fprintf(stdout, "reversed: %s\n", buffer);

  return 0;
}