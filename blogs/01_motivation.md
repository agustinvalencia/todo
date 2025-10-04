# Motivation

I have been trying to play with `rust` roaming around speed and safety. But then I realised that C++
although unsafe, it has a huge momentum of 40+ years, and therefore is not going anywhere. So why not
better re-take it and learn it to do on a safe way. 

I started reading about _modern C++_ -although the very first time I started studying C++ it was
already _modern_ - it felt, way more natural than studying rust, of course because I had already
some years of knowing it, and then the _safety_ concepts became to be way more clearer. 

Thus, across these notes I will be writing (yet another) to do list cli app, not meaning to be
actually used (but will open source it anyhow), but as a means to re-learn C++, now with a focus on
memory safety and more modern tooling (since I've been doing R and python for the last 7-8 years).

## The vision

I'd like to have a cli to handle to-do lists and projects that wraps them. Each object, i.e., task
and project, should be stored in an open portable format. As an obsidian user, I'll stick with
markdown and embedded yaml frontmatter. 

So, likely to have a way to manage files that could look like 

```markdown
---
type: project
id:
status:
created:
due:
done:
---

# Project title

## Logs
- {{date}} {{time}} - Created

```

## First steps

For this project I think I will start top to bottom, i.e., I will first create the cli layer
interacting with dummy objects and progressively implementing the features that come to my mind. In
this first blog I will focus on setting the building pipeline in place plus some dummy code to be
built. 

I want to explore what's out there in the wild akin to `cargo` for `C++` other than old makefiles
full of `PHONY` recipes and some other black magics I relied on more senior devs to handle for me. 


### Installing toolchain 

From now on I'll explain things meant for Mac OS, I am guessing linux users would be knowledgeable
on installing tools. For installing C++ libraries we'll prefer `CMake` and `FetchContent` rather
than installing libs globally via brew, similar to Rust's `cargo` or Python's `uv` that pull
dependencies per project.

```bash
xcode-select --install                     # Clang toolchain (one-time)
brew install cmake ninja llvm
```
In .zshrc: 

```bash
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export CC="$(brew --prefix llvm)/bin/clang"
export CXX="$(brew --prefix llvm)/bin/clang++"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
```
### First compilation

Let's organise things like this.

```
 .
├──  CMakeLists.txt
├── 󰣞 src
│   └──  main.cpp
└──  tests
    ├──  CMakeLists.txt
    └──  test_smoke.cpp
```
Where the C++ sources are:

`src/main.cpp`
```cpp
/* src/main.cpp */
#include <iostream>

int main() {
    std::cout << "hello from todo\n";
    return 0;
}
```

`tests/test_smoke.cpp`
```cpp
/* tests/test_smoke.cpp */
#include <catch2/catch_test_macros.hpp>

TEST_CASE("smoke test: Catch2 runs") {
    REQUIRE(true);
}
```
and the CMakeLists.txt


```bash
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug
cmake --build build
./build/todo
# -> hello from todo

ctest --test-dir build --output-on-failure
```
