#pragma once

#if defined(__has_include) && __has_include(<version>)
#include <version>  
#ifdef __cpp_lib_format  // std::format defined in C++20
#pragma message("Using std::format")
#include <format>
#define FORMAT_FOUND 1
#endif
#endif
#ifndef FORMAT_FOUND
#pragma message("Using fmt::format")
#include <fmt/format.h>

namespace std {
    inline namespace format_compat {
        using namespace fmt;
    }
}
#undef FORMAT_FOUND
#endif