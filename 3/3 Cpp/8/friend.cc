#include <iostream>
#include <print>

using namespace std;

class Box {
private:
  double width;
  double height;

  friend void printBoxDimensions(const Box &box);
  friend class BoxManager;
  friend ostream &operator<<(ostream &os, const Box &box);

public:
  Box(double w, double h) : width(w), height(h) {}

  string to_string() const { return format("Box({}, {})", width, height); }
};

void printBoxDimensions(const Box &box) {
  println("Width: {}, Height: {}", box.width, box.height);
}

ostream &operator<<(ostream &os, const Box &box) {
  os << "Box(" << box.width << ", " << box.height << ")";
  return os;
}

class BoxManager {
public:
  static double getArea(const Box &box) { return box.width * box.height; }
};

int main() {
  Box box(5.0, 3.0);

  printBoxDimensions(box);

  println("Area: {}", BoxManager::getArea(box));

  println("Box: {}", box.to_string());
  cout << "Box: " << box << endl;
}
