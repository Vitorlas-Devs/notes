#include <stdio.h>

// Using preprocessor directives:

#define LOWER -100
#define UPPER 400
#define STEP  100

// Using constants: (superior)

const int lower = -100;
const int upper = 400;
const int step  = 100;

double fahr2cels(double f)
{
  return (5.0 / 9.0) * (f - 32);
}

int main()
{
  int fahr;

  for (fahr = LOWER; fahr <= UPPER; fahr += STEP)
  {
    printf("Fahr = %4d,\tCels = %7.2f\n", fahr, fahr2cels(fahr));
  }

  return 0;
}