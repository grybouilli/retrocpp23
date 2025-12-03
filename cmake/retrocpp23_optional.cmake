include(FetchContent)

add_library(retrocpp23_optional INTERFACE)
add_library(retrocpp23::optional ALIAS retrocpp23_optional)

install(
    TARGETS retrocpp23_optional
    EXPORT retrocpp23Targets
)
if(  CMAKE_CXX_STANDARD LESS 23 OR 
    (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 12 AND CMAKE_COMPILER_IS_GNUCC) OR 
    (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 14 AND CMAKE_CXX_COMPILER_ID STREQUAL "Clang"))
    message("Using tl::optional as r23::optional")
    if(RETROCPP_FORCE_FIND_PACKAGE)
        find_package(tl-optional REQUIRED)
    else()
        set(ENABLE_TESTING OFF)
        set(OPTIONAL_BUILD_TESTS OFF)
        FetchContent_Declare(
            tl_optional
            GIT_REPOSITORY https://github.com/TartanLlama/optional.git
            GIT_TAG v1.1.0
            FIND_PACKAGE_ARGS NAMES tl-optional 
        )
        FetchContent_MakeAvailable(tl_optional)

        target_link_libraries(retrocpp23_optional INTERFACE tl::optional)
    endif()
    set(TL_OPTIONAL_USED "find_dependency(tl-optional REQUIRED)" CACHE INTERNAL "")
else()
    message("Using std::optional as r23::optional")
endif()
