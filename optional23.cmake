# if std::optional monads are not supported by current compiler, fetch older implementation
if(${CMAKE_CXX_STANDARD} LESS 23)
    message("Using tl::optional")
    set(ENABLE_TESTING OFF)
    FetchContent_Declare(
        optional
        GIT_REPOSITORY https://github.com/TartanLlama/optional.git
        GIT_TAG        v1.1.0
    )
    FetchContent_MakeAvailable(optional)

    if(optional_POPULATED)
    target_include_directories(${PROJECT_NAME}
            INTERFACE "${optional_SOURCE_DIR}/include"
        )   
    endif()
else()
    message("Using std::optional")
endif()