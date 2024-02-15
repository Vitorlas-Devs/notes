#include "functions.c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 100

int main(int argc, char **argv)
{
  char buffer[SIZE];
  int n;

  if (argc > 1)
  {
    n = atoi(argv[1]);
  }
  else
  {
    fprintf(stderr, "Expected 1 argument\n");
    exit(1);
  }

  char **t = (char **)malloc(n * sizeof(char *));

  for (int i = 0; i < n; i++)
  {
    fgets(buffer, SIZE, stdin);
    endStringAtNewline(buffer);

    if (strcmp(buffer, "end\n") == 0)
    {
      printf("END DETECTED\n");
      n = i;
      break;
    }

    size_t length = strlen(buffer);
    t[i] = (char *)malloc((length + 1) * sizeof(char));

    if (!t[i])
    {
      printf("Error allocating memory!");
      exit(1);
    }

    strcpy(t[i], buffer);
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