#include <memory>
#include <print>

using namespace std;

template <typename T>
class SmartPointer {
private:
  T *ptr;

public:
  SmartPointer(T *p) : ptr(p) {}

  ~SmartPointer() { delete ptr; }

  T &operator*() { return *ptr; }

  T *operator->() { return ptr; }
};
