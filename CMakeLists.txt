# cmake 3.14 버전 이상
cmake_minimum_required(VERSION 3.13)

set(PROJECT_NAME cmake_project_example)
set(PROJECT_SRC src/main.cpp
  src/buffer.cpp src/buffer.h
  src/common.cpp src/common.h
  src/context.cpp src/context.h
  src/program.cpp src/program.h
  src/shader.cpp src/shader.h
  src/vertex_layout.cpp src/vertex_layout.h)

# CXX === C++ 이란 같은 말
# C++ 17버전 사용
set(CMAKE_CXX_STANDARD 17)

# 환경변수
set(WINDOW_NAME "Hello, OpenGL!")
set(WINDOW_WIDTH 640)
set(WINDOW_HEIGHT 480)

project(${PROJECT_NAME})

find_package( OpenGL REQUIRED )

include(Dependency.cmake)

include_directories( ${OPENGL_INCLUDE_DIRS} )

add_subdirectory( glad )

if( MSVC )
    SET( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /ENTRY:mainCRTStartup" )
endif()

# src/main.cpp을 컴파일해 실행파일을 만듦
add_executable(${PROJECT_NAME} WIN32 ${PROJECT_SRC})

target_link_libraries(${PROJECT_NAME} ${OPENGL_LIBRARIES} glfw glad glm spdlog)

# 환경변수 주입
target_compile_definitions(${PROJECT_NAME} PUBLIC
    WINDOW_NAME="${WINDOW_NAME}"
    WINDOW_WIDTH=${WINDOW_WIDTH}
    WINDOW_HEIGHT=${WINDOW_HEIGHT}
    )


if( MSVC )
    if(${CMAKE_VERSION} VERSION_LESS "3.6.0") 
        message( "\n\t[ WARNING ]\n\n\tCMake version lower than 3.6.\n\n\t - Please update CMake and rerun; OR\n\t - Manually set 'GLFW-CMake-starter' as StartUp Project in Visual Studio.\n" )
    else()
        set_property( DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT GLFW-CMake-starter )
    endif()
endif()