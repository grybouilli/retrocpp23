#pragma once

#if __cplusplus > 202002L  // std::unexpected defined in C++23
#pragma message("Using std::expected")
#include <expected>
#else
#pragma message("Using tl::expected")
#include <tl/expected.hpp>

namespace std {
    inline namespace expected_compat {
        template <typename T, typename E>
        using expected = tl::expected<T, E>;

        template <class E>
        constexpr auto unexpected(E&& e)
            noexcept(std::is_nothrow_constructible_v<tl::unexpected<std::decay_t<E>>, E>)
            -> tl::unexpected<std::decay_t<E>> {
            return tl::unexpected<std::decay_t<E>>(std::forward<E>(e));
        }

        using tl::unexpect;
    }
}
#endif