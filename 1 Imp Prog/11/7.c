#include "functions.c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 100

int main()
{
  char buffer[SIZE];
  int n = 0;

  char **t = NULL;

  while (1)
  {
    fgets(buffer, SIZE, stdin);
    endStringAtNewline(buffer);

    if (strcmp(buffer, "end\n") == 0)
    {
      printf("END DETECTED\n");
      break;
    }

    size_t length = strlen(buffer);
    t = realloc(t, (n + 1) * sizeof(char *));

    if (!t)
    {
      printf("Memory allocation failed\n");
      exit(1);
    }

    t[n] = malloc((length + 1) * sizeof(char));

    if (!t[n])
    {
      printf("Memory allocation failed\n");
      exit(1);
    }

    strcpy(t[n], buffer);
    n++;
  }

  printf("\nreversed: \n");

  for (int i = n - 1; i >= 0; --i)
  {
    printf("%s", t[i]);
    free(t[i]);
  }

  free(t);

  return 0;
}