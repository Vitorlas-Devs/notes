#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <conio.h>
#include "../../lib/dropdown.h"

int scaling(int guesses, int size, int difficulty);
int guessing(int number, int max);

int main()
{
  srand(time(NULL));

  int number;     // The number to guess
  int guesses;    // An accumulator for the number of guesses
  int difficulty; // The difficulty level
  int max;        // Upper bound for the random number

  struct ColorString options[] = {
      {"Easy", 32},
      {"Medium", 33},
      {"Hard", 31},
      {"HARDCORE", 35}};
  
  union Option optionUnions[4];

  for (int i = 0; i < 4; i++)
  {
    optionUnions[i].colorString = options[i];
  }

  printf("Choose difficulty:\n\n");

  difficulty = dropdown(optionUnions, 4, 0, 1);

  if (difficulty == -1)
    return -1;

  difficulty = difficulty + 1;
  max = pow(10, difficulty);
  number = rand() % max + 1;

  // // DEBUG
  // printf("Number: %d\n", number);

  printf("Mode: %s\n", options[difficulty - 1].string);

  guesses = guessing(number, max);

  printf("You guessed it in %d tries!\n", guesses);

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

int guessing(int number, int max)
{
  int guess;
  int guesses = 0;

  do
  {
    printf("Guess a number between 1 and %d: ", max);
    scanf_s("%d", &guess);

    if (guess > number)
      printf("Too high!\n");
    else if (guess < number)
      printf("Too low!\n");

    guesses++;
  } while (guess != number);

  return guesses;
}