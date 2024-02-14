#include <stdio.h>

#define INPUT_LENGTH 100

void swap(char *a, char *b);

int main()
{
  char ch;
  char input[INPUT_LENGTH];
  int counter = 0;

  while ('0' <= (ch = getchar()) && counter < INPUT_LENGTH - 1)
  {
    if ('0' <= ch && ch <= '9')
      input[counter++] = ch;
    else
    {
      if (ch != '\n')
      {
        fprintf(stderr, "Error: Invalid digit: %c, at position: %d\n", ch, counter);
        return -1;
      }
    }
  }

  input[counter] = '\0';

  swap(&input[0], &input[counter - 1]);

  printf("%s", input);

  return 0;
}

void swap(char *a, char *b)
{
  char temp = *a;
  *a = *b;
  *b = temp;
}