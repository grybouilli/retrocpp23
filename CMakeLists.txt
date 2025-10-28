cmake_minimum_required(VERSION 3.11)
project(retrocpp23 LANGUAGES CXX)

include(FetchContent)
add_library(retrocpp23 INTERFACE)
add_library(retrocpp23::retrocpp23 ALIAS retrocpp23)

target_include_directories(retrocpp23 INTERFACE include)

# Optionally include helper modules depending on what the user wants
option(USE_FMT23 "Use fmt23" ON)
option(USE_OPTIONAL23 "Use optional23" ON)
option(USE_EXPECTED23 "Use expected23" ON)

if(USE_EXPECTED23)
  include(${CMAKE_CURRENT_LIST_DIR}/cmake/retrocpp23_expected.cmake)
  target_link_libraries(retrocpp23 INTERFACE retrocpp23::expected)
endif()

if(USE_OPTIONAL23)
  include(${CMAKE_CURRENT_LIST_DIR}/cmake/retrocpp23_optional.cmake)
  target_link_libraries(retrocpp23 INTERFACE retrocpp23::optional)
endif()

if(USE_FMT23)
  include(${CMAKE_CURRENT_LIST_DIR}/cmake/retrocpp23_fmt.cmake)
  target_link_libraries(retrocpp23 INTERFACE retrocpp23::fmt)
endif()
