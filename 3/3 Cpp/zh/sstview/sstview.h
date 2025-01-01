#ifndef SSTVIEW_H
#define SSTVIEW_H

#include <algorithm>
#include <iostream>
#include <set>
#include <stack>

#define DEBUG(msg, expr)                                                       \
  std::cout << msg << ": " << ((expr) ? "true" : "false") << "\n"

#define PRINT(x) std::cout << #x << ": " << (x) << "\n"

template <typename T>
concept Printable = requires(std::ostream &os, const T &t) {
  { os << t } -> std::convertible_to<std::ostream &>;
};

template <typename Container>
concept PrintableContainer =
    requires(const Container &c) {
      { c.begin() } -> std::input_iterator;
      { c.end() } -> std::input_iterator;
      { c.empty() } -> std::convertible_to<bool>;
      requires Printable<typename Container::value_type>;
    } && std::ranges::range<Container> && !std::is_scalar_v<Container> &&
    !std::is_same_v<Container, std::string> && !std::is_array_v<Container>;

template <PrintableContainer Container>
std::ostream &operator<<(std::ostream &out, const Container &container) {
  if (container.empty())
    return out << "{}";

  out << "{ " << *container.begin();
  std::for_each(std::next(container.begin()), container.end(),
                [&out](const auto &element) { out << ", " << element; });
  return out << " }";
}

template <typename T> class set_stack_view {
  typedef std::set<T> Set;
  typedef std::stack<T> Stack;

private:
  Set &set;
  Set original;
  Stack stack;

public:
  set_stack_view(Set &s) : set(s) {
    original = set;
    set.clear();
  }

  ~set_stack_view() { set = original; }

  void push(T item) {
    if (!set.contains(item)) {
      set.insert(item);
      stack.push(item);
    }
  }

  T top() const { return stack.top(); }
};

#endif // SSTVIEW_H
