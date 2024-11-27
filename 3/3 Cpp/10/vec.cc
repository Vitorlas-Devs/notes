#include "v.hh"
#include <iostream>

using namespace std;

// #vec is a string representation of vec
#define PRINT_VECTOR(vec) print_v(vec, #vec)

void print_v(V<int> &v, const string &name) {
  cout << name << " vector contents:" << endl;
  for (V<int>::iterator it = v.begin(); it != v.end(); it++) {
    cout << *it << " ";
  }
  cout << endl;
}

int main() {
  V<int> v1(2);
  v1.push_back(1);
  v1.push_back(2);
  v1.push_back(3);

  v1.pop_back();

  cout << "v1: " << v1.get_capacity() << "/" << v1.get_size() << endl;

  V<int> v2(2);
  v2.push_back(2);

  cout << "v1.begin() == v2.begin(): "
       << (v1.begin() == v2.begin() ? "true" : "false") << endl;

  PRINT_VECTOR(v1);
  PRINT_VECTOR(v2);

  V<int>::iterator it = v1.begin();
  V<int>::value_type new_value1 = *(v1.insert(it, 9));

  cout << "new_value: " << new_value1 << endl;

  it += 2;
  V<int>::value_type new_value2 = *(v1.insert(it, 9));

  PRINT_VECTOR(v1);

  cout << "new_value: " << new_value2 << endl;
}
