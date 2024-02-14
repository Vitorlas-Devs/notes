#include <stdio.h>

double avg(int *first, int *last);
int sum(int *first, int *last);
double avg2(int *first, int *last);

int main()
{
  int t[] = {2, 4, 1, 3, 5};
  int length = sizeof(t) / sizeof(t[0]);

  printf("avg: %.2f\n", avg(t, t + length));
  printf("avg2: %.2f\n", avg2(t, t + length));

  return 0;
}

double avg(int *first, int *last)
{
  double s = 0;
  int length = last - first;

  while (first != last)
  {
    s += *first;
    first++;
  }

  return s /= length;
}

int sum(int *first, int *last)
{
  int sum = 0;
  for (int i = 0; i < last - first; i++)
  {
    sum += first[i];
  }
  return sum;
}

double avg2(int *first, int *last)
{
  return sum(first, last) / (double)(last - first);
}