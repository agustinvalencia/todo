#include <english_greeter/greet.hpp>

namespace english_greeter {
    std::string greet (const std::string &name) {
        return "Hello, " + name + "!";
    }
} // namespace english_greeter
