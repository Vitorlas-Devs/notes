#include <stdio.h>

float toCelsius(int f);

int main()
{
  for (int i = -20; i <= 200; i += 10)
  {
    printf("%d F - %.2f C\n", i, toCelsius(i)); // ° character not ASCII
  }

  return 0;
}

float toCelsius(int f)
{
  float c = (f - 32) / 1.8;

  return c;
}