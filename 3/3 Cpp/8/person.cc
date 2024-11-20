#include "sptr.hpp"
#include <iostream>
#include <ostream>
#include <string>

using namespace std;

struct Person {
  string name;
  int age;

  Person(const string &name, int age) : name(name), age(age) {
    cout << "Person: " << name << " (" << age << ")" << endl;
  }

  friend ostream &operator<<(ostream &os, const Person &p) {
    return os << p.name << " (" << p.age << ")";
  }
};

void f(Sptr<Person> p) {
  cout << "F: " << *p << endl;
  Sptr<Person> p2(new Person("Ferenc", 40));
}

int main() {
  cout << "------" << endl;
  Sptr<Person> p(new Person("Bela", 30));

  Sptr<Person> p2(p);

  p = Sptr<Person>(new Person("Definitely Not Bela", 20));
  f(p);

  cout << (*p).name << endl;
  cout << p2->name << endl;
}
