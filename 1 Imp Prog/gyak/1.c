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
int game(char input[]);

int main()
{
  init();

  // int winner = game("ABDCAGEEE");
  // int winner = game("ABDCAEEEEEEFFFAC");
  // int winner = game("ABDCAEEEEEEFFG");
  // int winner = game("AAAAAAABBBBBBBCCCCCCCDDDDDDDEEEEEEEFFFFFFFGGGGGG");

  // int winner = game("ABDCAEEEEEEF");

  submit(1, 0);
  submit(2, 1);
  submit(1, 3);
  submit(2, 2);
  submit(1, 0);
  submit(2, 4);
  submit(1, 4);
  submit(2, 4);
  submit(1, 4);
  submit(2, 4);
  submit(1, 4);
  submit(1, 5);

  printTable();
  printf("%d\n", evaluate());

  // if (winner == -1)
  //   printf("Error!\n");
  // else if (winner)
  //   printf("Player %d won\n", winner);
  // else
  //   printf("Draw\n");

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
  int prevX[2] = {0, 0};
  int prevY[2] = {0, 0};

  for (int i = 0; i < MAX_ROWS; ++i)
  {
    for (int j = 0; j < MAX_COLS; ++j)
    {
      if (TABLE[i][j] == 0)
      {
        prevX[0] = 0;
        prevX[1] = 0;
      }
      else
      {
        if (prevX[0] != TABLE[i][j])
          prevX[0] = TABLE[i][j];
        else if (prevX[1] != TABLE[i][j])
          prevX[1] = TABLE[i][j];
        else if (prevX[0] == prevX[1] && prevX[1] == TABLE[i][j])
          return true;
      }
    }
    prevX[0] = 0;
    prevX[1] = 0;
  }

  for (int j = 0; j < MAX_COLS; ++j)
  {
    for (int i = 0; i < MAX_ROWS; ++i)
    {
      if (TABLE[i][j] == 0)
      {
        prevX[0] = 0;
        prevX[1] = 0;
      }
      else
      {
        if (prevY[0] != TABLE[i][j])
          prevY[0] = TABLE[i][j];
        else if (prevY[1] != TABLE[i][j])
          prevY[1] = TABLE[i][j];
        else if (prevY[0] == prevY[1] && prevY[1] == TABLE[i][j])
          return true;
      }
    }
    prevY[0] = 0;
    prevY[1] = 0;
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
