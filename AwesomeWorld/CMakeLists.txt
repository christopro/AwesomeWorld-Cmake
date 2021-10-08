cmake_minimum_required(VERSION 3.14)

project(AwesomeWorld VERSION 0.1 LANGUAGES CXX DESCRIPTION "Example to illustrate QTIFW")

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Core Quick REQUIRED)


set(PROJECT_SOURCES
    main.cpp
    qml.qrc
    )


qt_add_executable(awesomeWorld
    MANUAL_FINALIZATION
    ${PROJECT_SOURCES}
    )

target_compile_definitions(awesomeWorld
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(awesomeWorld
    PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick)

set_target_properties(awesomeWorld PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    )


qt_import_qml_plugins(awesomeWorld)
qt_finalize_executable(awesomeWorld)

