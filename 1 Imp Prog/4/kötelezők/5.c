#include <stdio.h>

int main()
{
  int date;
  printf("date (20231004) = ");
  scanf_s("%d", &date);

  int year = date / 10000;
  int month = (date / 100) % 100;
  int day = date % 100;

  printf("DD-MM-YYYY: %2d-%2d-%4d\n", day, month, year);

  return 0;
}