#ifndef GB_HPP
#define GB_HPP

#include <iostream>

using namespace std;

template <typename T> class gap_buffer {
private:
  T *v;
  int max;
  int gap_size;
  int gap_start;
  int gap_end;

public:
  gap_buffer(T *v, int m, int gs) : max(m), gap_size(gs) {
    this->v = v;
    gap_start = 0;
    gap_end = gap_size;
  }

  void insert(T item) {
    if (gap_start >= gap_end && gap_end < max) {
      gap_end++;
    }
    if (gap_start < gap_end) {
      v[gap_start++] = item;
    }
  }

  void right() {
    if (gap_end < max - 1) {
      v[gap_start++] = v[gap_end];
      v[gap_end++] = ' ';
    }
  }

  friend ostream &operator<<(ostream &os, const gap_buffer &obj) {
    for (int i = 0; i < obj.max; ++i)
      os << obj.v[i];

    return os;
  }
};

#endif
