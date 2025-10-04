#include <spanish_greeter/saludar.hpp>

namespace spanish_greeter {
    std::string saludar (const std::string &nombre) {
        return "Hola, " + nombre + "!";
    }
} // namespace spanish_greeter
