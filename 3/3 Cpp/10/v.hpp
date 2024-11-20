#ifndef V_HPP
#define V_HPP

#include <cstddef>

template <typename T> class V {
  T *data;
  size_t size;
  size_t capacity;

public:
  V(size_t capacity = 2) : data(new T[capacity]), size(0), capacity(capacity) {}

  V(const V<T> &v)
      : data(new T[v.capacity]), size(v.size), capacity(v.capacity) {
    for (size_t i = 0; i < size; i++) {
      data[i] = v.data[i];
    }
  }

  V<T> &operator=(const V<T> &v) {
    if (data != NULL) {
      delete[] data;
    }
    capacity = v.capacity;
    size = v.size;
    data = new T[capacity];
    for (size_t i = 0; i < size; i++) {
      data[i] = v.data[i];
    }
    return *this;
  }

  ~V() { delete[] data; }

  void push_back(const T &value) {
    if (size == capacity) {
      capacity *= 2;
      T *new_data = new T[capacity];
      for (size_t i = 0; i < size; i++) {
        new_data[i] = data[i];
      }
      delete[] data;
      data = new_data;
    }
    data[size++] = value;
  }

  void pop_back() { size--; }

  T &operator[](size_t index) { return data[index]; }

  size_t get_size() { return size; }
  size_t get_capacity() { return capacity; }
  bool empty() { return size == 0; }

  class iterator {
    T *ptr;
    size_t index;

    iterator(T *ptr, size_t index) : ptr(ptr), index(index) {}

  public:
    T &operator*() { return ptr[index]; }
    T *operator->() { return &ptr[index]; }

    iterator &operator++() {
      index++;
      return *this;
    }

    iterator &operator++(int) {
      iterator old = *this;
      index++;
      return old;
    }

    bool operator!=(const iterator &other) { return index != other.index; }
  };
};

#endif
