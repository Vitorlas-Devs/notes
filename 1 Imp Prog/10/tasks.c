#include "tasks.h"
#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define BUFFERSIZE 100

void feladat1(void)
{
  char buffer[BUFFERSIZE];

  fgets(buffer, BUFFERSIZE, stdin);

  wc(buffer);
}

void wc(const char s[])
{
  int chars = 0;
  int words = 0;

  while (*s != '\0')
  {
    if (isalpha(*s))
    {
      chars++;

      if (!isalpha(*(s + 1)))
        words++;
    }

    s++;
  }

  printf("chars: %d\n", chars);
  printf("words: %d\n", words);
}

void feladat2(void)
{
  char buffer1[BUFFERSIZE];
  char buffer2[BUFFERSIZE];

  fgets(buffer1, BUFFERSIZE, stdin);
  fgets(buffer2, BUFFERSIZE, stdin);

  printf("compare: %d\n", compare(buffer1, buffer2));
  printf("strcmp: %d\n", strcmp(buffer1, buffer2));
}

int compare(const char s1[], const char s2[])
{
  while (*s1 != '\0' && *s2 != '\0')
  {
    if (*s1 == *s2)
    {
      s1++;
      s2++;
    }
    else
    {
      return *s1 > *s2 ? 1 : -1;
    }
  }

  return 0;
}

void feladat3(void)
{
  char buffer1[BUFFERSIZE];
  char buffer2[BUFFERSIZE];
  char buffer3[BUFFERSIZE];

  fgets(buffer1, BUFFERSIZE, stdin);
  printf("buffer1: %s\n", buffer1);

  copy(buffer1, buffer2);
  printf("buffer2: %s\n", buffer2);

  strcpy(buffer3, buffer1);
  printf("buffer3: %s\n", buffer3);
}

void copy(const char from[], char to[])
{
  while (*from != '\0')
  {
    if (*from != '\n')
      *to = *from;

    from++;
    to++;
  }

  *to += '\0';
}

void feladat4(void)
{
  char t1[] = "alma";
  char *t2 = "alma";

  printf("sizeof t1: %d\n", sizeof(t1));
  printf("sizeof t2: %d\n", sizeof(t2));
}

void feladat5(void)
{
  const char file_name[] = "szoveg.txt";
  char buffer[BUFFERSIZE];

  FILE *input = fopen(file_name, "r");

  if (input)
  {
    while (fgets(buffer, BUFFERSIZE, input))
    {
      to_upper(buffer);
      printf("%s", buffer);
    }

    fclose(input);
  }
  else
  {
    fprintf(stderr, "Unable to open file.");
  }
}

void to_upper(char s[])
{
  while (*s != '\0')
  {
    if ('a' <= *s && *s <= 'z')
      *s += 'A' - 'a';

    s++;
  }
}

void feladat6(void)
{
  const char input_name[] = "szoveg.txt";
  const char output_name[] = "upper.txt";
  char buffer[BUFFERSIZE];

  FILE *input = fopen(input_name, "r");
  FILE *output = fopen(output_name, "w");

  if (input && output)
  {
    while (fgets(buffer, BUFFERSIZE, input))
    {
      to_upper(buffer);
      fprintf(output, "%s", buffer);
    }

    fclose(input);
    fclose(output);
  }
  else
  {
    fprintf(stderr, "Unable to open files.");
  }
}
