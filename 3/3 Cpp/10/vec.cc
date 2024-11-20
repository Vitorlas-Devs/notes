#include "v.hpp"
#include <iostream>

using namespace std;

int main() {
  V<int> v1(2);
  v1.push_back(1);
  v1.push_back(2);
  v1.push_back(3);

  v1.pop_back();

  cout << "v1: " << v1.get_capacity() << "/" << v1.get_size() << endl;
}
