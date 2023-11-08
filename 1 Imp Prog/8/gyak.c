#include <stdio.h>
#include <stdbool.h>

#define HEIGHT 10
#define WIDTH 10

void init(int table[HEIGHT][WIDTH], int nShips[4]);
void printTable(int table[HEIGHT][WIDTH], int nShips[4]);
int submit(
    int table[HEIGHT][WIDTH],
    int nShips[4],
    char colChar,
    int rowNumber,
    int lenght,
    char direction);
bool isValid(int table[HEIGHT][WIDTH], int rowI, int colI);
bool validate(int nShips[4]);

int main()
{
  int table[HEIGHT][WIDTH];
  int nShips[4] = {2, 3, 4, 5};

  init(table, nShips);
  
  submit(table, nShips, 'C', 1, 3, '_');
  submit(table, nShips, 'G', 1, 3, '_');
  
  printTable(table, nShips);

  printf("valid table? %s", validate(nShips) ? "yes" : "no");

  return 0;
}

bool validate(int nShips[4])
{
  int validNShips[4] = {1, 2, 1, 1};

  for (int i = 0; i < 4; ++i)
    if (validNShips[i] != nShips[i])
      return true;

  return false;
}

bool isValid(int table[HEIGHT][WIDTH], int rowI, int colI)
{
  for (int i = -1; i <= 1; ++i)
    for (int j = -1; j <= 1; ++j)
      if (
          0 <= rowI + i && rowI + i < HEIGHT &&
          0 <= colI + j && colI + j < WIDTH)
      {
        if (table[rowI][colI] == 7)
          return false;
      }

  return true;
}

// 0 - success
// 1 - bad length
// 2 - out of bounds
// 3 - neighboring ship

int submit(
    int table[HEIGHT][WIDTH],
    int nShips[4],
    char colChar,
    int rowNumber,
    int lenght,
    char direction)
{
  if (lenght < 2 || lenght > 5)
  {
    fprintf(stderr, "Invalid length\n");
    return 1;
  }

  int rowI = rowNumber - 1;
  int colI = colChar - 'A';

  if ('_' == direction)
  {
    if (colI + lenght > WIDTH)
    {
      fprintf(stderr, "Out of bounds: horizontal\n");
      return 2;
    }

    for (int i = 0; i < lenght; i++)
    {
      if (!isValid(table, rowI, colI + i))
      {
        fprintf(stderr, "Neighboring ship!\n");
        return 3;
      }
      table[rowI][colI + i] = 7;
    }
    nShips[lenght - 2] += 1;
    return 0;
  }

  if ('|' == direction && rowI + lenght > HEIGHT)
  {
    fprintf(stderr, "Out of bounds: vertical\n");
    return 2;

    for (int i = 0; i < lenght; i++)
    {
      if (!isValid(table, rowI + i, colI))
      {
        fprintf(stderr, "Neighboring ship!\n");
        return 3;
      }
      table[rowI + i][colI] = 7;
    }
    nShips[lenght - 2] += 1;
    return 0;
  }

  return -1;
}

void init(int table[HEIGHT][WIDTH], int nShips[4])
{
  for (int i = 0; i < HEIGHT; ++i)
    for (int j = 0; j < WIDTH; ++j)
      table[i][j] = 0;

  for (int i = 0; i < 4; ++i)
    nShips[i] = 0;
}

void printTable(int table[HEIGHT][WIDTH], int nShips[4])
{
  for (int i = 0; i < HEIGHT; ++i)
  {
    for (int j = 0; j < WIDTH; ++j)
      printf("%c ", table[i][j] ? 'X' : '~');

    printf("\n");
  }

  for (int i = 0; i < 4; ++i)
    printf("%d", nShips[i]);

  printf("\n");
}