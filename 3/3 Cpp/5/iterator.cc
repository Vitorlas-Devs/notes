#include <iostream>
#include <print>
#include <vector>

using namespace std;

int main() {
  println("hello world");
  vector<int> vec = {2, 5, 3, 4};

  for (int i = 0; i < vec.size(); i++) {
    // cout << vec[i] << endl;
    println("{}", vec[i]);
  }

  for (size_t i = 0; i < vec.size(); i++) {
    println("{}", vec[i]);
  }

  for (const auto &item : vec) {
    println("{}", item);
  }

  for (int i = 0; i < 5; i++) {
    vec.push_back(90 - i);
  }

  for (vector<int>::iterator it = vec.begin(); it != vec.end(); ++it) {
    // cout << *it << endl;
    println("{}", *it);
  }

  for (vector<int>::reverse_iterator it = vec.rbegin(); it != vec.rend();
       ++it) {
    println("{}", *it);
  }
}
