#ifndef DOMINO_H
#define DOMINO_H

#include <iostream>
#include <vector>

template <typename T> class domino {
  typedef std::pair<T, T> Pair;

private:
  std::vector<Pair> pairs;

public:
  domino(Pair p) { pairs = {p}; }

  bool push_back(const Pair &p) {
    if (pairs.back().second == p.first) {
      pairs.push_back(p);
    } else if (pairs.back().second == p.second) {
      pairs.push_back(std::make_pair(p.second, p.first));
    } else {
      return false;
    }

    return true;
  }

  bool contains(const Pair &p) const {
    for (const Pair &pair : pairs) {
      if (pair == p || pair == swap(p))
        return true;
    }
    return false;
  }

  domino &operator-=(const Pair &rhs) {
    for (typename std::vector<Pair>::iterator it = pairs.begin();
         it < pairs.end(); it++) {
      if (*it == rhs) {
        if (it == pairs.begin() || (it - 1)->second == (it + 1)->first ||
            it == pairs.end() - 1)
          pairs.erase(it);
      }
    }
    return *this;
  }

  size_t size() const { return pairs.size(); }

  static Pair swap(const Pair &p) { return std::make_pair(p.second, p.first); }

  friend std::ostream &operator<<(std::ostream &os, const domino &obj) {
    for (const Pair &pair : obj.pairs)
      os << "(" << pair.first << "," << pair.second << ")\n";
    return os;
  }
};

#endif // DOMINO_H
