# cmake/warnings.cmake

# Attach warnings to specific targets (PRIVATE: don't propagate to consumers).
function(set_strict_warnings target)
  if (MSVC)
    target_compile_options(${target} PRIVATE /W4 /permissive- /EHsc)
  else()
    target_compile_options(${target} PRIVATE -Wall -Wextra -Wpedantic
                                             -Wconversion -Wsign-conversion
                                             -Wshadow -Wold-style-cast)
  endif()
endfunction()
