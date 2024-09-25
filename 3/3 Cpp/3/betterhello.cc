#include <iostream>
#include <print>
#include <string>

int main() {
  std::println("ok guys i read the c++ docs im not using 20 yrs old c++");

  int x{10};
  int y = 20;
  int z(30);
  int *w = new int{40};

  int a = 2;
  int& b = a;

  std::println("x: {}", x);
  std::println("y: {}", y);
  std::println("z: {}", z);
  std::println("w: {}", *w);
}
