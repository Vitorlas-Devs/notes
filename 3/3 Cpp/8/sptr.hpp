#ifndef SPTR_HPP
#define SPTR_HPP

#include <cstddef>
#include <iostream>

using namespace std;

template <typename T> class Sptr {
  T *p;
  int *c;

public:
  Sptr(T *p) : p(p), c(new int(1)) {}

  Sptr(const Sptr &s) : p(s.p), c(s.c) {
    ++*c;
    cout << "Copy: " << *p << ", " << *c << endl;
  }

  ~Sptr() {
    cout << "~Dtor: " << *p << ", " << *c << endl;
    if (--*c == 0) {
      delete p;
      delete c;
    }
  }

  Sptr &operator=(const Sptr &rhs) {
    if (c != NULL) {
      --*c;
      if (*c == 0) {
        delete p;
        delete c;
      }
    }
    p = rhs.p;
    c = rhs.c;
    ++*c;
    cout << "=Assign: " << *p << ", " << *c << endl;
    return *this;
  }

  T &operator*() { return *p; }
  T *operator->() { return p; }
};

#endif
