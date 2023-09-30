#include <stdio.h>

int isPrime(int x);

int main()
{

  for (int i = 2; i <= 1000; ++i)
  {
    int prime = isPrime(i);

    if (prime)
    {
      printf("%d, ", prime);
    }
  }

  return 0;
}

int isPrime(int x)
{
  for (int i = 2; i < x; ++i)
  {
    if (x % i == 0)
    {
      return 0;
    }
  }

  return x;
}