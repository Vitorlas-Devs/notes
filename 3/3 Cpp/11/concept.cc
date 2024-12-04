#include <concepts>
#include <iostream>
#include <string>

using namespace std;

template <typename T>
concept Streamable = requires(ostream &os, T value) {
  { os << value } -> convertible_to<ostream &>;
};

struct Person {
  int age;
  string name;

  Person(int a, string n) : age(a), name(n) {}

  friend ostream &operator<<(ostream &os, const Person &p) {
    os << "Person { age: " << p.age << ", name: " << p.name << " }";
    return os;
  }
};

template <Streamable T> void debug(const T &item) {
#ifdef DEBUG
  cout << "time: " << item << endl;
#endif
}

int main() {
  cout << "hello" << endl << endl;

  debug(11);
  debug("asd");
  debug("dgfh");

  Person p(1, "Bela");
  debug(p);
}
