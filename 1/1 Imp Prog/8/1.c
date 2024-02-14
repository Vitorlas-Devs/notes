#include <ctype.h>
#include <stdio.h>

// ctype includes these useful functions:
// - isalpha(c) - returns true if c is a letter
// - isdigit(c) - returns true if c is a digit
// - isxdigit(c) -returns true if c is a hexadeciaml character
// - isalnum(c) - returns true if c is a letter or a digit
// - isspace(c) - returns true if c is a whitespace character
// - isupper(c) - returns true if c is an uppercase letter
// - islower(c) - returns true if c is a lowercase letter
// - toupper(c) - returns the uppercase equivalent of c
// - tolower(c) - returns the lowercase equivalent of c

int main()
{
  char ch;
  ch = getchar();

  switch (ch)
  {
  case 'A':
    printf("A!\n");
    break;
  case 'B':
    printf("B!\n");
    break;
  default:
    printf("default\n");
    break;
  }

  if (isxdigit(ch))
    printf("hex");
  else
    printf("not hex");

  return 0;
}