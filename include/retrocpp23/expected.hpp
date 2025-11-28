#pragma once

#if defined(__has_include) && __has_include(<version>)
#include <version>  
#if __cpp_lib_expected >= 202211L  // std::unexpected defined in C++23
#pragma message("Using std::expected")
#include <expected>

namespace r23
{
    using std::expected;
    using std::unexpected;
}
#define EXPECTED_FOUND 1
#endif
#endif
#ifndef EXPECTED_FOUND
#pragma message("Using tl::expected")
#include <tl/expected.hpp>

namespace r23
{
    using tl::expected;
    using tl::unexpected;
}
#undef EXPECTED_FOUND
#endif