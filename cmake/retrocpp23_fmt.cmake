include(FetchContent)

add_library(retrocpp23_fmt INTERFACE)
add_library(retrocpp23::fmt ALIAS retrocpp23_fmt)

install(
    TARGETS retrocpp23_fmt
    EXPORT retrocpp23Targets
)
if(CMAKE_CXX_STANDARD LESS 23 OR 
    (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 13 AND CMAKE_COMPILER_IS_GNUCC) OR 
    (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 17 AND CMAKE_CXX_COMPILER_ID STREQUAL "Clang"))
    message("Using fmt::format")
    if(RETROCPP_FORCE_FIND_PACKAGE)
        find_package(fmt REQUIRED)
    else()
        set(FMT_TEST OFF)
        set(FMT_INSTALL ON)
        FetchContent_Declare(
            fmt
            GIT_REPOSITORY https://github.com/fmtlib/fmt
            GIT_TAG 12.0.0
            FIND_PACKAGE_ARGS NAMES fmt
        )
        FetchContent_MakeAvailable(fmt)

        target_link_libraries(retrocpp23_fmt INTERFACE fmt::fmt-header-only)
    endif()
    set(FMT_USED "find_dependency(fmt REQUIRED)" CACHE INTERNAL "")
else()
    message("Using std::format")
endif()
