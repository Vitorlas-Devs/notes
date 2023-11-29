#include "functions.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

void endStringAtNewline(char s[])
{
  while (*s != '\0')
  {
    if (*s == '\n')
      *s = '\0';
    return;
  }
  s++;
}

void reverse(char s[])
{
  size_t length = strlen(s);

  for (size_t i = 0; i < length / 2; ++i)
  {
    char tmp = s[i];
    s[i] = s[length - i - 1];
    s[length - i - 1] = tmp;
  }
}

char *reverseDyn(const char s[])
{
  size_t length = strlen(s);

  char *reversed = (char *)malloc((length + 1) * sizeof(char));

  if (!reversed)
  {
    printf("Error allocating memory!");
    exit(1);
  }

  for (size_t i = 0; i < length; ++i)
  {
    reversed[i] = s[length - i - 1];
  }

  return reversed;
}