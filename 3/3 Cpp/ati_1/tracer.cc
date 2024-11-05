#include <iostream>

class Tracer {
  char id;

public:
  Tracer(char c) : id(c) { std::cout << "Constructing " << id << std::endl; }
  ~Tracer() { std::cout << "Destroying " << id << std::endl; }
};

int main() {
  std::cout << "Entering main scope" << std::endl;
  {
    std::cout << "Entering block scope" << std::endl;
    Tracer a('a');
    Tracer b('b');
    std::cout << "Leaving block scope" << std::endl;
  }
  std::cout << "Leaving main scope" << std::endl;
  return 0;
}
