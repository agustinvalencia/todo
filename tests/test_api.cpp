#include <catch2/catch_test_macros.hpp>
#include <english_greeter/greet.hpp>
#include <spanish_greeter/saludar.hpp>

TEST_CASE ("English greeter") {
    REQUIRE(english_greeter::greet("World") == "Hello, World!");
}

TEST_CASE ("Spanish greeter") {
    REQUIRE(spanish_greeter::saludar("Mundo") == "Hola, Mundo!");
}
