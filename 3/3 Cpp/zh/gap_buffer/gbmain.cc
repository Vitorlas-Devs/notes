#include "gapbuffer.h"
#include <algorithm>
#include <cstring>
#include <cwchar>
#include <iostream>

const int MAX = 50;
const int GAP_SIZE = 10;

using namespace std;

int main() {
  int your_mark = 1;
  // 2-es
  char v[MAX];
  for (int i = 0; i < MAX; ++i) {
    v[i] = ' ';
  }

  gap_buffer<char> gbc(v, MAX, GAP_SIZE);
  gbc.insert('L');
  gbc.right();
  gbc.insert('o');
  gbc.right();
  gbc.insert('r');
  gbc.right();
  gbc.insert('e');
  gbc.right();
  gbc.insert('m');
  gbc.right();
  gbc.right();
  gbc.right();
  gbc.insert('i');
  gbc.right();
  gbc.insert('p');
  gbc.right();
  gbc.insert('s');
  gbc.right();
  gbc.insert('u');
  gbc.right();
  gbc.insert('m');
  gbc.insert('.');
  gbc.insert('\0');

  char vv[] = "  It is a very long buffer.  ";
  gap_buffer<char> gbcv(vv, sizeof(vv) / sizeof(vv[0]), 2);
  gbcv.right();
  gbcv.right();

  wchar_t w[] = L"  blabla  ";
  gap_buffer<wchar_t> gbw(w, sizeof(w) / sizeof(w[0]), 2);
  gbw.insert(L'!');
  gbw.insert(L'!');
  gbw.insert(L'!');
  w[10] = L'\0';

  if (0 == std::strcmp(v, "L o r e m   i p s u m.") && 'I' == vv[0] &&
      't' == vv[1] && 0 == std::wcscmp(w, L"!!!lblabla")) {
    your_mark = std::count(vv, vv + sizeof(vv), 't');
  }

  cout << (0 == std::strcmp(v, "L o r e m   i p s u m.")) << "\n"; 
  cout << ('I' == vv[0]) << "\n"; 
  cout << ('t' == vv[1]) << "\n"; 
  cout << (0 == std::wcscmp(w, L"!!!lblabla")) << "\n"; 
  cout << v << "\n";
  cout << vv << "\n";

  for (char v : w)
    cout << v;
  cout << "\n";

  /* 3-as
  for( int i = 0; i < MAX; ++i )
  {
    gbw.erase();
  }
  gbw.insert( L'.' );
  gbw.insert( L'.' );
  gbw.insert( L'.' );

  gbc.left();
  gbc.erase();
  gbc.insert( '!' );

  for( int i = 0; i < MAX; ++i )
  {
    gbcv.insert( '?' );
    gbcv.erase();
  }

  if( 0 == std::strcmp( v, "L o r e m   i p s u m!" ) && L'.' == w[ 1 ] &&
      1 == std::count( vv, vv + sizeof( vv ) / sizeof( vv[ 0 ] ), '?' ) )
  {
    your_mark = std::count( w, w + sizeof( w ) / sizeof( w[ 0 ] ), L'.' );
  }
  */
  /* 4-es
  std::swap( gbcv.at( 1 ), gbcv.at( 4 ) );
  gbcv.at( 24 ) = '?';
  gbw.at( 2 ) = L'_';

  char str[] = "Hello!";
  const gap_buffer<char> cgb( str, sizeof( str ) / sizeof( str[ 0 ] ), 2 );

  if( 's' == gbcv.at( 1 ) && 't' == gbcv.at( 4 ) && 's' == vv[ 1 ] &&
      'l' == cgb.at( 0 ) && 'l' == cgb.at( 1 ) && L'_' == gbw.at( 2 ) )
  {
    your_mark = std::count( w, w + sizeof( w ) / sizeof( w[ 0 ] ), L'b' ) +
                std::count( w, w + sizeof( w ) / sizeof( w[ 0 ] ), L'a' );
  }
  */
  /* 5-os
  char gw[] = "Goodbye Cruel World!";
  gap_buffer<char> tr( gw, sizeof( gw ) / sizeof( gw[ 0 ] ), 13 );
  tr += "Hello";

  wchar_t wm[ MAX ];
  gap_buffer<wchar_t> wb( wm, MAX, MAX / 2 );
  wb += L"I <3 C++";

  if( 'e' == tr[ 1 ] && 'W' == tr[ 6 ] && L'<' == wm[ 2 ] && L'3' == wb[ 3 ] )
  {
    your_mark = std::count( gw, gw + sizeof( gw ) / sizeof( gw[ 0 ] ), 'o' ) +
                std::count( gw, gw + sizeof( gw ) / sizeof( gw[ 0 ] ), 'e' );
  }
  */
  std::cout << "Your mark is " << your_mark << std::endl;
}
