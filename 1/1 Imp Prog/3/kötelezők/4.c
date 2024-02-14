#include <stdio.h>

int main()
{
  int year;

  printf("Enter a year: ");

  // fflush(stdin); // ???

  scanf("%d", &year);

  printf("%s\n",
         (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
             ? "1 Leap year"
             : "1 Not a leap year");

  printf("%s\n",
         0 == year % 4
             ? 0 == year % 100
                   ? 0 == year % 400
                         ? "2 Leap year"
                         : "2 Not a leap year"
                   : "2 Leap year"
             : "2 Not a leap year");

  return 0;
}