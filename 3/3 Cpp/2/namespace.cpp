#include <iostream>

using namespace std;

namespace foo {
int x;
namespace bar {
int y;
}
} // namespace foo

int main() {
  cout << "Hello World!" << endl;

  cout << "x: " << foo::x << endl;      // 0
  cout << "y: " << foo::bar::y << endl; // 0
}
