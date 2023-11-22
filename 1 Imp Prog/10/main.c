#include <stdio.h>
#include <stdlib.h>
#include "tasks.h"

int main(int argc, char *argv[])
{

  // print the parameters
  // for (int i = 0; i < argc; ++i) {
  //   printf("%d: %s\n", i, argv[i]);
  // }

  int taskNumber;

  if (!argv[1]) fprintf(stderr, "Invalid parameters!\n");
  
  taskNumber = atoi(argv[1]);

  switch (taskNumber) {
    case 1: feladat1(); break;
    case 2: feladat2(); break;
    case 3: feladat3(); break;
    case 4: feladat4(); break;
    case 5: feladat5(); break;
    case 6: feladat6(); break;
    default: fprintf(stderr, "Not implemented\n");
  }
  
  return 0;
}
