#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <conio.h>

#define ESC "\033"
#define UP 72
#define DOWN 80
#define ENTER 13

int scaling(int guesses, int size, int difficulty);

int main()
{
  srand(time(NULL));

  int number;                                   // The number to guess
  int guess;                                    // The user's guess
  int guesses = 0;                              // An accumulator for the number of guesses
  int difficulty;                               // The difficulty level
  int max;                                      // Upper bound for the random number
  char *options[] = {"Easy", "Medium", "Hard"}; // The options for the dropdown menu
  int num_options = 3;                          // The number of options
  int selected = 1;                             // The index of the selected option
  int key;                                      // The key pressed by the user

  printf("Choose difficulty:\n\n");

  while (1)
  {
    for (int i = 0; i < num_options; i++)
    {
      if (i == selected)
        printf(ESC "[7m %s " ESC "[0m\n", options[i]);
      else
        printf(" %s \n", options[i]);
    }

    key = _getch();

    if (key == 0 || key == 224)
      key = _getch();

    if (key == UP)
    {
      selected--;
      if (selected < 0)
        selected = num_options - 1;
    }
    else if (key == DOWN)
    {
      selected++;
      if (selected >= num_options)
        selected = 0;
    }
    else if (key == ENTER)
      break;
    else if (key == 27)
      return -1;

    printf(ESC "[%dA", num_options);
  }

  difficulty = selected + 1;

  switch (difficulty)
  {
  case 1:
    max = 10;
    printf("Mode: Easy\n");
    break;
  case 2:
    max = 100;
    printf("Mode: Medium\n");
    break;
  case 3:
    max = 10000;
    printf("Mode: Hard\n");
    break;
  default:
    printf("Invalid difficulty!\n");
    return 1;
  }

  number = rand() % max + 1;

  // // DEBUG
  // printf("Number: %d\n", number);

  do
  {
    printf("Guess the number (1-%d): ", max);
    scanf_s("%d", &guess);

    if (guess < number)
      printf("Too low!\n");
    else if (guess > number)
      printf("Too high!\n");

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
  int index = scaling(guesses, size, difficulty);

  printf("%s\n", praises[index]);

  // // Debug line to print what praise is given for each number of guesses
  // for (int i = 1; i <= 30; i++)
  // {
  //   printf("%d: %s\n", i, praises[scaling(i, size, difficulty)]);
  // }

  return 0;
}

int scaling(int guesses, int size, int difficulty)
{
  int index = floor(guesses / (difficulty * 1.0) - 0.5);

  if (index < 0)
    index = 0;
  if (index > size)
    index = size;

  return index;
}
