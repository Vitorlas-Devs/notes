#include <string>

class Example {
private:
  std::string name;
  int value;

public:
  // Default constructor
  Example() = default;

  // Parameterized constructor
  Example(std::string n, int v) : name(std::move(n)), value(v) {}

  // Copy constructor
  Example(const Example &other) : name(other.name), value(other.value) {}

  // Move constructor
  Example(Example &&other) noexcept
      : name(std::move(other.name)), value(other.value) {}

  // Converting constructor
  explicit Example(int v) : name("default"), value(v) {}

  // Delegating constructor
  Example(const std::string &n) : Example(n, 0) {}

  // Copy assignment operator
  Example &operator=(const Example &other) {
    if (this != &other) {
      name = other.name;
      value = other.value;
    }
    return *this;
  }

  // Move assignment operator
  Example &operator=(Example &&other) noexcept {
    if (this != &other) {
      name = std::move(other.name);
      value = other.value;
    }
    return *this;
  }

  // Destructor
  ~Example() = default;
};

int main(){
  Example e1;
  Example e2("example", 42);
  Example e3(e2);
  Example e4(std::move(e3));
  Example e5(42);
  Example e6("example");
  Example e7 = e6;
  Example e8 = std::move(e7);
  return 0;
}
