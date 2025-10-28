#pragma once

#if __cplusplus >= 202002L  // concepts defined in C++20
#pragma message("Using std::same_as")
#include <concepts>
#else
#pragma message("Using std::is_same in place of std::same_as")
#include <type_traits>

namespace std {
    inline namespace format_compat {
        template<typename T, typename U>
        constexpr bool same_as = std::is_same<T,U>::value;
    }
}
#endif