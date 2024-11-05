# c++ modules

clang++ -std=c++2b -fmodules -fbuiltin-module-map --precompile math.cc -o math.pcm
clang++ -std=c++2b -fmodules -fbuiltin-module-map main.cc math.pcm && a.exe

clang++ -std=c++2b -fmodules -fmodule-file=math=math.pcm -c math.ixx -o math.obj
clang++ -std=c++2b -fmodules -fmodule-file=math=math.pcm main.cc math.obj -o program.exe
