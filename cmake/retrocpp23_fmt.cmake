include(FetchContent)

add_library(retrocpp23_fmt INTERFACE)
add_library(retrocpp23::fmt ALIAS retrocpp23_fmt)

if(CMAKE_CXX_STANDARD LESS 23)

    FetchContent_Declare(
        fmt
        GIT_REPOSITORY https://github.com/grybouilli/fmt
        GIT_TAG ea5cf3220c36e6df490a493a02e10b8876217778
    )
    FetchContent_MakeAvailable(fmt)

    target_link_libraries(retrocpp23_fmt INTERFACE fmt::fmt)
else()
    message("Using std::expected")
endif()
