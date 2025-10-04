#include <english_greeter/greet.hpp>
#include <iostream>
#include <spanish_greeter/saludar.hpp>

int main () {
    std::cout << english_greeter::greet("CMake") << '\n';
    std::cout << spanish_greeter::saludar("CMake") << '\n';
}
