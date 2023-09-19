#include <stdio.h>

int main()
{
  int fahr;

  for (fahr = -100; fahr <= 400; fahr += 100)
  {
    // bad version:
    // - 5/9 is 0 because of integer division
    // - %d is used but that prints an integer
    // printf("Fahr = %d,\tCels = %d\n", fahr, (5/9)*(fahr-32));

    // good version:
    // - 5.0/9.0 is 0.5555...
    // - %f is used to print a float
    printf("Fahr = %d,\tCels = %f\n", fahr, (5.0 / 9.0) * (fahr - 32));
  }

  return 0;
}