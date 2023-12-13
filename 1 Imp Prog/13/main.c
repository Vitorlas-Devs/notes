#include "func.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main()
{
  system("cowthink 'I like Boxes'");

  initialize();
  print_stack();
  push(1);
  print_stack();
  push(2);
  print_stack();
  push(3);
  print_stack();
  copy_top();
  print_stack();

  while (!is_empty())
    pop();

  return 0;
}