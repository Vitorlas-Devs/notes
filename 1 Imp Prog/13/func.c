#include "func.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

Box *top = NULL;

void initialize()
{
  top = NULL;
}

bool is_empty()
{
  return top == NULL;
}

int peek()
{
  if (is_empty())
    return -1;

  return top->weight;
}

void push(int weight)
{
  Box *box = malloc(sizeof(Box));
  box->weight = weight;
  box->next = top;
  top = box;
}

void pop()
{
  if (is_empty())
    return;

  Box *box = top;
  top = top->next;
  free(box);
}

void copy_top()
{
  if (is_empty())
    return;

  Box *box = malloc(sizeof(Box));
  box->weight = top->weight;
  box->next = top;
  top = box;
}

void print_stack()
{
  Box *current = top;
  printf("Stack: ");
  while (current != NULL)
  {
    printf("+---+ ");
    current = current->next;
  }
  printf("\n       ");
  current = top;
  while (current != NULL)
  {
    printf("| %1d | ", current->weight);
    current = current->next;
  }
  printf("\n       ");
  current = top;
  while (current != NULL)
  {
    printf("+---+ ");
    current = current->next;
  }
  printf("\n");
}