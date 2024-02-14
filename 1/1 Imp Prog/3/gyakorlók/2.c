#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

int scaling(int guesses, int size);

int main()
{
  srand(time(NULL));

  int number = rand() % 100 + 1;
  int guess;
  int guesses = 0;

  // // DEBUG
  // printf("Number: %d\n", number);

  do
  {
    printf("Guess the number (1-100): ");
    scanf_s("%d", &guess);

    if (guess < number)
    {
      printf("Too low!\n");
    }
    else if (guess > number)
    {
      printf("Too high!\n");
    }

    guesses++;
  } while (guess != number);

  printf("\nYou guessed %d times.\n", guesses);

  char *praises[] = {
      "Godlike!",
      "Monstrous!",
      "Legendary!",
      "Insane!",
      "Epic!",
      "Awesome!",
      "Great!",
      "Good!",
      "Not bad!",
      "You can do better!"};

  int size = sizeof(praises) / sizeof(praises[0]) - 1;
  int index = scaling(guesses, size);

  printf("%s\n", praises[index]);

  // // Debug line to print what praise is given for each number of guesses
  // for (int i = 1; i <= 30; i++)
  // {
  //   printf("%d: %s\n", i, praises[scaling(i, size)]);
  // }

  return 0;
}

int scaling(int guesses, int size)
{
  int index = floor(guesses / 2.0 - 0.5);

  if (index < 0)
    index = 0;
  if (index > size)
    index = size;

  return index;
}
