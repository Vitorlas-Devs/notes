#ifndef _INC_FUNC
#define _INC_FUNC

#include <stdbool.h>

typedef struct Box
{
  int weight;
  struct Box *next;
} Box;

extern Box *top;

void initialize();
bool is_empty();
int peek();
void push(int weight);
void pop();
void copy_top();

void print_stack();

#endif