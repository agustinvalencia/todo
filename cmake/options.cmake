# cmake/options.cmake

# Toggle for the example app (cache var: can be set with -DHELLO_BUILD_APP=OFF)
option(HELLO_BUILD_APP "Build the example app" ON)

# Emit compile_commands.json for clangd and tooling
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Default C++ dialect for generators/IDEs. We'll also declare per-target below.
set(CMAKE_CXX_STANDARD 23)           # maps to -std=c++23 or MSVC equivalent
set(CMAKE_CXX_STANDARD_REQUIRED ON)  # do not silently fall back
set(CMAKE_CXX_EXTENSIONS OFF)        # use ISO, not gnu++23
