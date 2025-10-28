include(FetchContent)

add_library(retrocpp23_fmt INTERFACE)
add_library(retrocpp23::fmt ALIAS retrocpp23_fmt)

if(CMAKE_CXX_STANDARD LESS 23)
    set(FMT_TEST OFF)
    set(FMT_INSTALL OFF)
    FetchContent_Declare(
        fmt
        GIT_REPOSITORY https://github.com/fmtlib/fmt
        GIT_TAG 12.0.0
    )
    FetchContent_MakeAvailable(fmt)

    target_link_libraries(retrocpp23_fmt INTERFACE fmt::fmt)
else()
    message("Using std::format")
endif()
