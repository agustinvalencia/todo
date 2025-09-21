cmake_minimum_required(VERSION 3.26)
project(todo LANGUAGES CXX VERSION 0.1.0)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(FetchContent)

# ---- Third-party (we add more later) ----
# Catch2 for tests
FetchContent_Declare(Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG v3.6.0
)
FetchContent_MakeAvailable(Catch2)

# ---- Library (header-only for now; replace with STATIC later) ----
# If you already have sources (e.g., src/todo.cpp and include/todo.hpp),
# switch to STATIC and add them to target_sources (see commented block below).
add_library(todo_lib INTERFACE)
target_include_directories(todo_lib INTERFACE
  ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# add_library(todo_lib
#   # empty for now; we’ll add sources as we go
# )
# target_include_directories(todo_lib PUBLIC src)

add_executable(todo src/main.cpp)
target_link_libraries(todo PRIVATE todo_lib)

# ---- Tests ----
enable_testing()
add_executable(tests tests/test_smoke.cpp)
target_link_libraries(tests PRIVATE todo_lib Catch2::Catch2WithMain)

include(CTest)
include(Catch)
catch_discover_tests(tests)
