include(FetchContent)

add_library(retrocpp23_optional INTERFACE)
add_library(retrocpp23::optional ALIAS retrocpp23_optional)

install(
    TARGETS retrocpp23_optional
    EXPORT retrocpp23Targets
)
if(CMAKE_CXX_STANDARD LESS 23)
    message("Using tl::optional as retrocpp23::optional")
    set(ENABLE_TESTING OFF)
    set(OPTIONAL_BUILD_TESTS OFF)
    FetchContent_Declare(
        tl_optional
        GIT_REPOSITORY https://github.com/TartanLlama/optional.git
        GIT_TAG v1.1.0
    )
    FetchContent_MakeAvailable(tl_optional)

    target_link_libraries(retrocpp23_optional INTERFACE tl::optional)
else()
    message("Using std::optional")
endif()
