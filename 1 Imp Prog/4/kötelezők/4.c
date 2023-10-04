#include <stdio.h>

const double PI = 3.14159265358979323846;

int main()
{
    int r;
    printf("r = ");
    scanf_s("%d", &r);

    int d = 2 * r;

    printf("d = %d\n", d);

    double k = 2 * PI * r;

    printf("k = %f\n", k);

    double t = PI * r * r;

    printf("t = %f\n", t);

  return 0;
}