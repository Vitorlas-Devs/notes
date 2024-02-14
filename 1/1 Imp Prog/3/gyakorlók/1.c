#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
  printf("-- [ Guessing Game ] --");

  srand(time(NULL));
  int secretNumber = rand() % 100 + 1;

  while (1)
  {
    printf("\nPlease input your guess.\n");

    int input;

    scanf_s("%d", &input);

    if (input == secretNumber)
    {
      printf("You win!");
      break;
    }
    else if (input < secretNumber)
    {
      printf("Too small!");
    }
    else
    {
      printf("Too big!");
    }
  }

  return 0;
}