#ifndef PRINTSIZE_H
#define PRINTSIZE_H

#include <stdio.h>
#include <wchar.h>

#include <io.h>
#include <fcntl.h>
#ifndef _O_U16TEXT
#define _O_U16TEXT 0x20000
#endif

// This function sets the output to UTF-8

// ⚠️ This only works as long as you are not printing variables with the % format specifier.

void setUTF8() {
  _setmode(_fileno(stdout), _O_U16TEXT);
}

void print_test() {
  wprintf(L"%s\n", L"Árvíztűrő tükörfúrógép");
}

#endif