#ifndef NUM_H
#define NUM_H

template <typename T> class Num {
  T n;

public:
  Num(T n) : n(n) {}
  Num &operator++() {
    ++n;
    return *this;
  }
};

#endif
