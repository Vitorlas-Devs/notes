#include <stdio.h>

#define N 10

void fill(int matrix[N][N]);
void fill(int matrix[][N]);
void fill(int (*matrix)[N]);
void print(int (*matrix)[N]);

int main()
{
  int matrix[N][N];

  fill(matrix);

  print(matrix);

  // matrix[i][j] == *(matrix[i] + j)
  // matrix[i][j] == *(*(matrix + i) + j)
  // int matrix[N][N] == int *matrix[N]

  return 0;
}

void fill(int (*matrix)[N])
{
  for (int i = 0; i < N; i++)
    for (int j = 0; j < N; j++)
      matrix[i][j] = (i + 1) * (j + 1);
}

void print(int (*matrix)[N])
{
  for (int i = 0; i < N; i++)
  {
    for (int j = 0; j < N; j++)
      printf("%d\t", matrix[i][j]);
    printf("\n");
  }
}