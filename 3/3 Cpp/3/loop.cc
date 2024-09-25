#include <iterator>
#include <print>
#include <vector>

using namespace std;

int main() {
  // vector
  vector<int> v{1, 2, 3, 4, 5};

  for (auto i : v) {
    print("{} ", i);
  }
  print("\n");

  for (int i = 0; i < v.size(); i++) {
    print("{} ", v[i]);
  }
  print("\n");

  for (auto it = v.begin(); it != v.end(); it++) {
    print("{} ", *it);
  }
  print("\n");

  // stuff
  
}
