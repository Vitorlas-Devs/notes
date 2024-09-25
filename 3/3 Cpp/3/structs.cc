#include <print>

struct Point {
  int x;
  int y;
};

int main() {
  Point p{10, 20};
  std::println("p.x: {}", p.x);

  Point z;
  z = std::move(p);
  std::println("z.x: {}", z.x);
  std::println("p.x: {}", p.x); // works
  // This is because int is a trivial type and they are copied by value

  Point *p1 = new Point{10, 20};
  std::println("p1->x: {}", p1->x);

  Point *p2 = std::move(p1);
  std::println("p2->x: {}", p2->x);
  // std::println("p1->x: {}", p1->x); // undefined behavior
  // no compile time error tho
}
