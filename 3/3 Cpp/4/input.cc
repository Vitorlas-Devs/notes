#include <iostream>
#include <print>
#include <string>

using namespace std;

// char toUpper(char c) {
//   if (!(c >= 'a' && c <= 'z')) {
//     return c;
//   }

//   constexpr int diff = 'a' - 'A';
//   return c - diff;
// }

string toUpper(string s) {
  for (char& c : s) {
    c = toupper(c);
  }
  return s;
}

int main() {
  // char name[256];
  // cout << "Name: " << endl << "> ";
  // cin >> name;
  // name[3] = '\0';
  // cout << "Hello " << name << endl;

  string name;
  print("Name:\n> ");
  cin >> name;
  println("Hello {}", toUpper(name));
}
