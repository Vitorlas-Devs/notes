# c++ modules

clang++ -std=c++2b -fmodules -fbuiltin-module-map --precompile hello.cc -o hello.pcm
clang++ -std=c++2b -fmodules -fbuiltin-module-map main.cc hello.pcm && a.exe

clang++ -std=c++2b -fmodules -fmodule-file=hello=hello.pcm -c hello.ixx -o hello.obj
clang++ -std=c++2b -fmodules -fmodule-file=hello=hello.pcm main.cc hello.obj && a.exe
