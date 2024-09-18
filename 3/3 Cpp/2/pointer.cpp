#include <iostream>

using namespace std;

const int TOKEN = 420;

int magicTokenToCoin(int token, int coins = TOKEN) { return (coins * token); }

int main() {
  int x = 10;
  int *p = &x;
  cout << *p << endl; // 10
  *p = 20;
  cout << x << endl; // 20

  cout << magicTokenToCoin(42) << endl;
}
