#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#define MAX_ROWS 6
#define MAX_COLS 7
int TABLE[MAX_ROWS][MAX_COLS];

void init();
void printTable();
bool submit(int player, int col);
bool evaluate();
int game(char *input);

int main()
{
  init();

  // int winner = game("ABDCAGEEE");
  int winner = game("ABDCAEEEEEEFFFAC");
  // int winner = game("ABDCAEEEEEEFFG");
  // int winner = game("AAAAAAABBBBBBBCCCCCCCDDDDDDDEEEEEEEFFFFFFFGGGGGG");

  printTable();

  if (winner == -1)
    printf("Error!\n");
  else if (winner)
    printf("Player %d won\n", winner);
  else
    printf("Draw\n");

  return 0;
}

int game(char input[])
{
  // -1: error
  // 0: draw
  // 1: player 1 wins
  // 2: player 2 wins

  int i = 0;
  while (input[i] != '\0')
  {
    if (i % 2 == 0)
    {
      if (!submit(1, input[i] - 'A'))
        return -1;
      if (evaluate())
        return 1;
    }
    else
    {
      if (!submit(2, input[i] - 'A'))
        return -1;
      if (evaluate())
        return 2;
    }
    ++i;
  }

  return 0;
}

bool evaluate()
{

  for (int i = 2; i < MAX_ROWS; ++i)
  {
    for (int j = 0; j < MAX_COLS; ++j)
    {
      if (TABLE[i][j] != 0)
      {
        if (TABLE[i][j] == TABLE[i - 1][j] && TABLE[i][j] == TABLE[i - 2][j])
          return true;
      }
    }
  }

  for (int i = 0; i < MAX_ROWS; ++i)
  {
    for (int j = 2; j < MAX_COLS; ++j)
    {
      if (TABLE[i][j] != 0)
      {
        if (TABLE[i][j] == TABLE[i][j - 1] && TABLE[i][j] == TABLE[i][j - 2])
          return true;
      }
    }
  }

  return false;
}

bool submit(int player, int col)
{
  if (col < 0 || col > MAX_COLS - 1)
  {
    fprintf(stderr, "Invalid column number: %d\n", col);
    return false;
  }

  for (int i = MAX_ROWS - 1; i >= 0; --i)
  {
    if (TABLE[i][col] == 0)
    {
      TABLE[i][col] = player;
      return true;
    }
  }

  fprintf(stderr, "No space in col %d\n", col);
  return false;
}

void init()
{
  for (int i = 0; i < MAX_ROWS; ++i)
    for (int j = 0; j < MAX_COLS; ++j)
      TABLE[i][j] = 0;
}

void printTable()
{
  for (int i = 0; i < MAX_ROWS; ++i)
  {
    for (int j = 0; j < MAX_COLS; ++j)
      printf("%d ", TABLE[i][j]);

    printf("\n");
  }
  printf("\n");
}
