// DO NOT EDIT

#include "domino.h"
#include <iostream>
#include <string>
#include <utility>

#define DEBUG(msg, expr)                                                       \
  std::cout << msg << ": " << ((expr) ? "true" : "false") << "\n"

template <int N> struct congruent {

  bool operator()(int a, int b) const { return a % N == b % N; }
};

struct equal_length {

  bool operator()(const std::string &lhs, const std::string &rhs) const {
    return lhs.length() == rhs.length();
  }
};

const int max = 2;

int main() {
  int your_mark = 1;
  // 2-es
  domino<int> dm(std::make_pair(0, 0));
  for (int i = 0; i < max; ++i) {
    dm.push_back(std::make_pair(i, i + 1));
  }

  domino<int> di(std::make_pair(4, 7));
  di.push_back(std::make_pair(6, 7));
  di.push_back(std::make_pair(5, 6));
  di.push_back(std::make_pair(3, 4));

  domino<std::string> ds(std::make_pair("C", "C++"));
  ds.push_back(std::make_pair("C++", "Ada"));
  ds.push_back(std::make_pair("Ada", "Ada"));
  ds.push_back(std::make_pair("C++", "C++"));
  ds.push_back(std::make_pair("Ada", "Python"));
  const domino<std::string> cds = ds;

  if (di.contains(std::make_pair(6, 5)) &&
      !cds.contains(std::make_pair("C++", "C++")) &&
      !ds.push_back(std::make_pair("Haskell", "C#")) &&
      dm.contains(std::make_pair(max / 2, max / 2 + 1)) &&
      !di.contains(std::make_pair(4, 3)) &&
      cds.contains(std::make_pair("Ada", "C++")) &&
      di.contains(std::make_pair(7, 4))) {
    your_mark += ds.contains(std::make_pair("C", "C++"));
  }

  // 3-as
  std::pair<std::string, std::string> hw("Hello", "World");
  domino<std::string> hello(hw);
  hello -= hw;
  ds -= std::make_pair("Ada", "Ada");
  dm -= std::make_pair(max - 1, max);
  ds -= std::make_pair("C++", "Ada");
  di -= std::make_pair(4, 7);

  if (ds.contains(std::make_pair("C++", "Ada")) &&
      !dm.contains(std::make_pair(max, max - 1)) &&
      !ds.contains(std::make_pair("Ada", "Ada")) && 4 == cds.size() &&
      !hello.contains(hw) && max == dm.size() && 2 == di.size()) {
    your_mark = ds.size();
  }

  // 4-es
  // domino<std::string, equal_length> dse(std::make_pair("Basic", "Pascal"));
  // dse.push_back(std::make_pair("Prolog", "C++"));
  // dse.push_back(std::make_pair("Ada", "Simula"));
  // dse -= std::make_pair("Modula", "SQL");

  // domino<std::string> p(std::make_pair("C", "C++"));
  // p.push_back(std::make_pair("C++", "Ada"));

  // domino<int> dmp(std::make_pair(0, max));

  // domino<int, congruent<3>> dc(std::make_pair(2, 6));
  // dc.push_back(std::make_pair(9, 4));
  // dc.push_back(std::make_pair(1, 5));
  // dc -= std::make_pair(2, 1);

  // if (dse.contains(std::make_pair("OCaml", "Python")) && cds.contains(p) &&
  //     ds.contains(p) && !dm.contains(dmp) &&
  //     !dc.contains(std::make_pair(1, 5))) {
  //   your_mark = dse.size() + dc.size();
  // }

  /* 5-os
  domino<std::string, equal_length> dses = dse[ std::make_pair( "Algol",
  "Eiffel" ) ];

  const domino<int> dms = dm[ std::make_pair( 2, 3 ) ];

  domino<std::string, equal_length> a( std::make_pair( "CSS", "Cilk++" ) );
  a.push_back( std::make_pair( "Scala", "Oberon" ) );

  domino<std::string, equal_length> b( std::make_pair( "DCL", "Cilk++" ) );

  if( 2 == dses.size() && dses.contains( std::make_pair( "Delphi", "Coq" ) ) &&
     dses == a && !( cds == ds ) && !( b == a ) )
  {
    your_mark = dms.size() + dses.size();
  }
  */
  std::cout << "Your mark is " << your_mark;
  std::endl(std::cout);
}
