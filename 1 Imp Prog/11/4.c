#include "functions.c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 100
#define N 5

int main()
{
  char buffer[SIZE];
  char *t[N];

  for (int i = 0; i < N; i++)
  {
    fgets(buffer, SIZE, stdin);
    endStringAtNewline(buffer);

    size_t length = strlen(buffer);
    t[i] = (char *)malloc((length + 1) * sizeof(char));

    if (!t[i])
    {
      printf("Error allocating memory!");
      exit(1);
    }

    strcpy(t[i], buffer);
  }

  printf("reversed: \n");

  for (int i = N - 1; i >= 0; --i)
  {
    printf("%s", t[i]);
    free(t[i]);
  }

  return 0;
}