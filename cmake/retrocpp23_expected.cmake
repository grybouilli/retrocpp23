include(FetchContent)

add_library(retrocpp23_expected INTERFACE)
add_library(retrocpp23::expected ALIAS retrocpp23_expected)

install(
    TARGETS retrocpp23_expected
    EXPORT retrocpp23Targets
)
if(  CMAKE_CXX_STANDARD LESS 23 OR 
    (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 13 AND CMAKE_COMPILER_IS_GNUCC) OR 
    (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 16 AND CMAKE_CXX_COMPILER_ID STREQUAL "Clang"))
    message("Using tl::expected as r23::expected")
    set(BUILD_TESTING OFF)
    FetchContent_Declare(
        tl_expected
        GIT_REPOSITORY https://github.com/TartanLlama/expected.git
        GIT_TAG v1.1.0
    )
    FetchContent_MakeAvailable(tl_expected)

    target_link_libraries(retrocpp23_expected INTERFACE tl::expected)
else()
    message("Using std::expected as r23::expected")
endif()
