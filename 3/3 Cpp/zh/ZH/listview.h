#ifndef LISTVIEW_H
#define LISTVIEW_H

#include <algorithm>
#include <iostream>
#include <list>
#include <vector>

template <typename T, typename Cont> class array_view {
  typedef std::list<T> List;
  typedef typename std::list<T>::iterator Iterator;

protected:
  List &list;
  Cont its;

public:
  array_view(List &list) : list(list) {
    for (Iterator it = list.begin(); it != list.end(); it++) {
      its.push_back(it);
    }
  }

  T &at(const size_t idx) const { return *(its[idx]); }

  T &operator[](const size_t idx) const { return *(its[idx]); }
};

template <typename T, typename Cont>
class vector_view : public array_view<T, Cont> {
  typedef std::list<T> List;
  typedef typename std::list<T>::iterator Iterator;

public:
  vector_view(List &list) : array_view<T, Cont>(list) {}

  void push_back(T item) {
    this->list.push_back(item);
    this->its.push_back(--this->list.end());
  }
};

#endif // LISTVIEW_H
