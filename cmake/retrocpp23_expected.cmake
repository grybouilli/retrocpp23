include(FetchContent)

add_library(retrocpp23_expected INTERFACE)
add_library(retrocpp23::expected ALIAS retrocpp23_expected)

install(
    TARGETS retrocpp23_expected
    EXPORT retrocpp23Targets
)
if(CMAKE_CXX_STANDARD LESS 23)
    message("Using tl::expected as retrocpp23::expected")
    set(BUILD_TESTING OFF)
    FetchContent_Declare(
        tl_expected
        GIT_REPOSITORY https://github.com/TartanLlama/expected.git
        GIT_TAG v1.1.0
    )
    FetchContent_MakeAvailable(tl_expected)

    target_link_libraries(retrocpp23_expected INTERFACE tl::expected)
else()
    message("Using std::expected")
endif()
