#include <iostream>
#include <print>
#include <string>
#include <x86intrin.h>

using namespace std;

struct P {
  int x;
};

int main() {
  static int z = 10;

  int a = 6;
  auto b = static_cast<char>(a);

  println("b: {}", b);

  P p{10};
  // int *px = &p.x;
  int *px = reinterpret_cast<int *>(p.x);

  println("p.x: {}", *px);
}
