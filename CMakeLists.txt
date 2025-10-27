cmake_minimum_required(VERSION 3.11)
project(retrocpp23 LANGUAGES CXX)

include(FetchContent)
add_library(${PROJECT_NAME} INTERFACE)

set(USE_ALL ON)

if(USE_EXPECTED23 OR USE_OPTIONAL23 OR USE_FMT23)
    set(USE_ALL OFF)
endif()
    
if(USE_ALL OR USE_EXPECTED23)
    include(expected23.cmake)
    target_link_libraries(${PROJECT_NAME}
      INTERFACE
        tl::expected
    )
endif()

if(USE_ALL OR USE_OPTIONAL23)
    include(optional23.cmake)
    target_link_libraries(${PROJECT_NAME}
      INTERFACE
        tl::optional
    )
endif()

file(GLOB retrocpp23_sources "include/retrocpp23/*.hpp")
target_sources(${PROJECT_NAME} 
    INTERFACE ${retrocpp23_sources}
)

target_include_directories(${PROJECT_NAME}
    INTERFACE include
)

add_library(retrocpp23::retrocpp23 ALIAS retrocpp23)