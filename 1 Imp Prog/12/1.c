#include <stdio.h>

typedef struct
{
  double w;
  int x;
  int y;
} Point;

typedef enum
{
  Red = 0,
  Green,
  Blue
} Color;

typedef union
{
  float f;
  double d;
  int i;
  char c;
} Data;

int main()
{
  // Structs
  printf("Size of Point struct: %d\n", sizeof(Point));

  Point p = {1.2, 2, 3};

  p.x = 6;

  // Enums
  Color myFavColor = Blue;

  printf("Fav color: %d\n", myFavColor);

  // Unions
  Data data = {.f = 1.7};

  data.f = 12.3;
  data.d = 23.2;

  printf("d: %f\n", data.d);
  data.i = 69;
  printf("d: %f\n", data.d);

  return 0;
}