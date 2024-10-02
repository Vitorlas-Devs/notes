#include <iostream>
#include <print>

using namespace std;

int main() {
  int t[]{4, 9, 2, 6, 1, 4};

  for (int *i = t; i < t + 6; i++) {
    // cout << *i << endl;
    println("{}", *i);
  }
}
