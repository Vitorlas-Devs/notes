#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

void solveQuadratic(float a, float b, float c, float *r1, float *r2);

int main()
{
  clock_t start, end;
  double elapsed;
  start = clock();

  float a, b, c, *r1, *r2;

  printf("Enter a, b, c:\n");
  scanf_s("%f %f %f", &a, &b, &c);

  r1 = malloc(sizeof(float));
  r2 = malloc(sizeof(float));

  solveQuadratic(a, b, c, r1, r2);

  printf("Roots: %f, %f", *r1, *r2);

  free(r1);
  free(r2);

  end = clock();
  elapsed = ((double)(end - start)) / CLOCKS_PER_SEC;
  printf("\n\nTime elapsed: %f", elapsed);

  return 0;
}

void solveQuadratic(float a, float b, float c, float *r1, float *r2)
{
  float d = pow(b, 2) - 4 * a * c;

  if (d <= 0 && a == 0)
  {
    printf("No real roots or not a quadratic equation");
    return;
  }

  *r1 = (-b + sqrt(d)) / (2 * a);
  *r2 = (-b - sqrt(d)) / (2 * a);
}
