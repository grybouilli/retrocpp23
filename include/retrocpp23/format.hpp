#pragma once

#ifdef __cpp_lib_format  // std::format defined in C++20
#pragma message("Using std::format")
#include <format>
#else
#pragma message("Using fmt::format")
#include <fmt/format.h>

namespace std {
    inline namespace format_compat {
        using namespace fmt;
    }
}
#endif