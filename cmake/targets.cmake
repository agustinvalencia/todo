# cmake/targets.cmake

# 1) Explicit source list keeps CI deterministic and diffs readable.
set(ENGLISH_SOURCES ${CMAKE_SOURCE_DIR}/src/greet.cpp)

# 2) Define a library target. CMake will compile greet.cpp -> greet.o
#    then archive/link it into libenglish_lib.(a|so|dylib) as appropriate.
add_library(english_lib ${ENGLISH_SOURCES})

# 3) Export the public header root. PUBLIC: apply to the lib and its consumers.
target_include_directories(english_lib
  PUBLIC ${CMAKE_SOURCE_DIR}/include)

# 4) Require C++23 per target. PUBLIC so consumers inherit it.
target_compile_features(english_lib PUBLIC cxx_std_23)

# 5) Apply warnings without exporting them.
set_strict_warnings(english_lib)

# 6) Optional example app linking the library (leaf target: PRIVATE link is fine).
if(HELLO_BUILD_APP)
  add_executable(greeter_app ${CMAKE_SOURCE_DIR}/app/main.cpp)
  target_link_libraries(greeter_app PRIVATE english_lib)
  set_strict_warnings(greeter_app)

  # Convenience target to run from the build tree
  add_custom_target(run
    COMMAND $<TARGET_FILE:greeter_app>
    DEPENDS greeter_app
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Running greeter_app")
endif()
