include(FetchContent)

add_library(retrocpp23_jthread INTERFACE)
add_library(retrocpp23::jthread ALIAS retrocpp23_jthread)

install(
    TARGETS retrocpp23_jthread
    EXPORT retrocpp23Targets
)

if(RETROCPP_FORCE_FIND_PACKAGE)
    find_package(jthread-lite REQUIRED)
else()
    FetchContent_Declare(
        jthread-lite
        GIT_REPOSITORY https://github.com/nonstd-lite/jthread-lite
        GIT_TAG 0d936135a420b54244913e9226c9b040eeb6d1be
        FIND_PACKAGE_ARGS NAMES jthread-lite
    )
    FetchContent_MakeAvailable(jthread-lite)

endif()
target_link_libraries(retrocpp23_jthread INTERFACE nonstd::jthread-lite)
set(JTHREAD_USED "find_dependency(jthread-lite REQUIRED)" CACHE INTERNAL "")
