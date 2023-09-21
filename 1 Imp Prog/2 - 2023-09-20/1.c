#include <stdio.h>

int var;

int main()
{
  // reference an external (global) variable
  extern var;

  // print var's value uninitialized
  // var's value without initialization is 0
  printf("%d\n", var);

  // print var's memory address
  // %p is the format specifier for a pointer
  // we need to cast to void* because printf expects a void* for %p
  // the type void* is a generic pointer type
  printf("Address of var = %p\n", (void *)&var);

  return 0;
}