#ifndef V_HPP
#define V_HPP

#include <cstddef>

template <typename T> class V {
  T *data;
  size_t size;
  size_t capacity;

public:
  typedef T value_type;
  typedef T &ref_type;
  typedef const T &const_ref_type;
  typedef T *pointer_type;
  typedef size_t size_type;

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

  class iterator;

  iterator begin() const { return iterator(data, 0); }
  iterator end() const { return iterator(data, size); }

  iterator insert(iterator &pos, const T &value) {
    if (size == capacity) {
      size_t position = pos.index;
      capacity *= 2;
      T *new_data = new T[capacity];

      for (size_t i = 0; i < position; i++) {
        new_data[i] = data[i];
      }

      new_data[position] = value;

      for (size_t i = position; i < size; i++) {
        new_data[i + 1] = data[i];
      }

      delete[] data;
      data = new_data;
      size++;
      return iterator(data, position);
    } else {
      size_t position = pos.index;

      for (size_t i = size; i > position; i--) {
        data[i] = data[i - 1];
      }

      data[position] = value;
      size++;
      return iterator(data, position);
    }
  }

  iterator erase(const iterator &pos) {
    if (pos.index >= size) {
      return end();
    }

    for (size_t i = pos.index; i < size - 1; ++i) {
      data[i] = data[i + 1];
    }

    size--;
    return pos;
  }

  void clear() {
    delete[] data;
    data = new T[capacity];
    size = 0;
  }

  class iterator {
    T *ptr;
    size_t index;
    friend class V<T>;

    iterator(T *ptr, size_t index) : ptr(ptr), index(index) {}

  public:
    T &operator*() const { return ptr[index]; }
    T *operator->() const { return &ptr[index]; }

    iterator &operator++() {
      index++;
      return *this;
    }
    iterator operator++(int) {
      iterator old = *this;
      index++;
      return old;
    }

    iterator &operator--() {
      --index;
      return *this;
    }
    iterator operator--(int) {
      iterator old = *this;
      index++;
      return old;
    }

    iterator &operator+=(size_t n) {
      index += n;
      return *this;
    }
    iterator &operator-=(size_t n) {
      index -= n;
      return *this;
    }

    bool operator==(const iterator &other) const {
      return ptr == other.ptr && index == other.index;
    }
    bool operator!=(const iterator &other) const {
      return ptr != other.ptr || index != other.index;
    }

    iterator operator+(size_t n) const { return iterator(ptr, index + n); }
    iterator operator-(size_t n) const { return iterator(ptr, index - n); }
  };
};

#endif
