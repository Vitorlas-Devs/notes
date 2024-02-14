#include <stdio.h>

int compare(char s[]);

int main()
{
  char s[100];

  printf("Enter a string: ");
  fgets(s, sizeof(s), stdin);

  printf("Count of characters: %d\n", compare(s) - 1); // -1 because of the \n character

  return 0;
}

int compare(char s[])
{
  int i = 0;
  while (s[i] != '\0')
  {
    i++;
  }
  return i;
}