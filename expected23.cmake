# if std::unexpected / std::expected is not supported by current compiler, fetch older implementation
if(${CMAKE_CXX_STANDARD} LESS 23)
    message("Using tl::expected")
    set(ENABLE_TESTING OFF)
    FetchContent_Declare(
        expected
        GIT_REPOSITORY https://github.com/TartanLlama/expected.git
        GIT_TAG        v1.1.0
    )
    FetchContent_MakeAvailable(expected)

    if(expected_POPULATED)
    target_include_directories(${PROJECT_NAME}
            INTERFACE "${expected_SOURCE_DIR}/include"
        )   
    endif()
else()
    message("Using std::expected")
endif()