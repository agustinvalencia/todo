cmake_minimum_required(VERSION 3.26)   # Require modern features and policy defaults

project(hello_modern                   # Project name visible to tools and IDEs
  VERSION 0.1.0                        # Semantic versioning, useful for packaging
  LANGUAGES CXX)                       # Limit this project to C++ only

# Include our modular configuration
include(cmake/options.cmake)           # Compiler standard and build options
include(cmake/warnings.cmake)          # Warning flags per target
include(cmake/dependencies.cmake)      # External libraries fetched from GitHub
include(cmake/targets.cmake)           # The library and example application
include(cmake/tests.cmake)             # Test infrastructure with Catch2

include(CMakePackageConfigHelpers)

write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/greeterConfigVersion.cmake"
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY SameMajorVersion
)

configure_package_config_file(
  "${CMAKE_SOURCE_DIR}/cmake/greeterConfig.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/greeterConfig.cmake"
  INSTALL_DESTINATION lib/cmake/greeter
)

install(FILES
  "${CMAKE_CURRENT_BINARY_DIR}/greeterConfig.cmake"
  "${CMAKE_CURRENT_BINARY_DIR}/greeterConfigVersion.cmake"
  DESTINATION lib/cmake/greeter
)
