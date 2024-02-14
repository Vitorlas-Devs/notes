#include <stdio.h>
#include <string.h>

int compare(char a[], char b[]);

int main()
{
  char a[100], b[100];

  printf("a = ");
  fgets(a, sizeof(a), stdin);

  printf("b = ");
  fgets(b, sizeof(b), stdin);

  a[strlen(a) - 1] = '\0';
  b[strlen(b) - 1] = '\0';

  printf("The '%s' string is alphabetically %s than the '%s' string.\n", a, compare(a, b) < 0 ? "smaller" : "bigger", b);

  return 0;
}

int compare(char a[], char b[])
{
  int i = 0;
  while (a[i] != '\0' && b[i] != '\0')
  {
    if (a[i] != b[i])
    {
      return a[i] - b[i];
    }
    i++;
  }
  return a[i] - b[i]; // if the strings are equal, return 0
}