#include <stdio.h>

int reverse(int sum);

int main()
{
  int num;

  scanf("%d", &num);

  printf("%d -> %d\n", num, reverse(num));

  int i = 0;

  return 0;
}

int reverse(int num)
{
  int reversed = 0;

  while (num != 0)
  {
    reversed = reversed * 10 + num % 10;
    num /= 10;
  }

  // let's think step by step how this works
  // num = 123
  // reversed = 0

  // 1st iteration:
  // reversed = 0 * 10 + 123 % 10 = 0 + 3 = 3
  // num = 123 / 10 = 12

  // 2nd iteration:
  // reversed = 3 * 10 + 12 % 10 = 30 + 2 = 32
  // num = 12 / 10 = 1

  // 3rd iteration:
  // reversed = 32 * 10 + 1 % 10 = 320 + 1 = 321
  // num = 1 / 10 = 0

  // 4th iteration:
  // num == 0, so we exit the loop

  // the takeaway here is that:
  // - we can get the last digit of a number by doing num % 10
  // - we can remove the last digit of a number by doing num / 10

  return reversed;
}