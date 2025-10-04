# cmake/targets.cmake

# --- English module ---
set(ENGLISH_SOURCES ${CMAKE_SOURCE_DIR}/src/greet.cpp)
add_library(english_lib ${ENGLISH_SOURCES})

# Use include/ during local builds, and prefix/include after install
target_include_directories(english_lib PUBLIC
  $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)

target_compile_features(english_lib PUBLIC cxx_std_23)
set_strict_warnings(english_lib)

# --- Spanish module ---
set(SPANISH_SOURCES ${CMAKE_SOURCE_DIR}/src/saludar.cpp)
add_library(spanish_lib ${SPANISH_SOURCES})

target_include_directories(spanish_lib PUBLIC
  $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)

target_compile_features(spanish_lib PUBLIC cxx_std_23)
set_strict_warnings(spanish_lib)

# --- Aggregate (no sources; re-exports usage requirements) ---
add_library(world_lib INTERFACE)
target_link_libraries(world_lib INTERFACE english_lib spanish_lib)

# --- Optional app ---
if(HELLO_BUILD_APP)
  add_executable(greeter_app ${CMAKE_SOURCE_DIR}/app/main.cpp)
  target_link_libraries(greeter_app PRIVATE world_lib)
  set_strict_warnings(greeter_app)
endif()

# --- Install & export (unchanged) ---
install(TARGETS english_lib spanish_lib world_lib
  EXPORT greeterTargets
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin
  INCLUDES DESTINATION include
)

install(DIRECTORY ${CMAKE_SOURCE_DIR}/include/ DESTINATION include)

install(EXPORT greeterTargets
  NAMESPACE greeter::
  DESTINATION lib/cmake/greeter
)
