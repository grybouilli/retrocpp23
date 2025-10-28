#pragma once

#if __cplusplus > 202002L  // std::optional monads defined in C++23
#pragma message("Using std::optional")
#include <optional>
#else
#pragma message("Using tl::optional")
#include <tl/optional.hpp>

namespace std {
    inline namespace optional_compat {
        template <typename T>
        using optional = tl::optional<T>;
        constexpr auto nullopt = tl::nullopt;
    }
}
#endif