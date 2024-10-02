#include <iostream>
#include <print>
#include <string>

using namespace std;

int inc(int a) { return a + 1; }

void unsafeInc(int &a) { a += 1; }

int main() {
  const int x = 10;
  int y = 6;

  println("x: {}", inc(x));

  unsafeInc(y);
  println("x: {}", y);
}
