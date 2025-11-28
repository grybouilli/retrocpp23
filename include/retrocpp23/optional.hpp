#pragma once

#if __cpp_lib_optional >= 202110L  // std::optional monads defined in C++23
#pragma message("Using std::optional")
#include <optional>
namespace r23
{
    using std::optional;
    constexpr auto nullopt = std::nullopt;
}
#else
#pragma message("Using tl::optional")
#include <tl/optional.hpp>

namespace r23
{
    using tl::optional;
    constexpr auto nullopt = tl::nullopt;
}
#endif