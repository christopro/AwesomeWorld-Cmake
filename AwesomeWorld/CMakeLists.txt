cmake_minimum_required(VERSION 3.19)

project(AwesomeWorld VERSION 0.1 LANGUAGES CXX DESCRIPTION "Example to illustrate QTIFW")

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(REQUIRED_QT_VERSION "6.2.0")


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
    PRIVATE
        Qt::Core
        Qt::Quick
)

set_target_properties(awesomeWorld PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER  awesomeworld.ics.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
)

qt_import_qml_plugins(awesomeWorld)
qt_finalize_executable(awesomeWorld)

##################COPYING TO PACKAGE FOLDER
set(BIN_NAME "awesomeWorld")
install (TARGETS awesomeWorld DESTINATION bin)

##################COPYING TO PACKAGE FOLDER
#from https://vilelasagna.ddns.net/coding/learning-cmake/
if(WIN32)
    find_program(WINDEPLOYQT windeployqt HINTS "${_qt_bin_dir}")
    if(WINDEPLOYQT)       
        install(CODE "execute_process(COMMAND ${WINDEPLOYQT} bin WORKING_DIRECTORY \${CMAKE_INSTALL_PREFIX})")
    endif()
endif()


##################CPACK
include(InstallRequiredSystemLibraries)


set(CPACK_GENERATOR "IFW")
set(CPACK_IFW_ROOT "C:/Qt6/Tools/QtInstallerFramework/4.1")

set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "0")

set (CPACK_IFW_PACKAGE_NAME "Awesome World")
set (CPACK_IFW_PACKAGE_TITLE "Awesome World Installer")
set (CPACK_IFW_PACKAGE_PUBLISHER "Fictional Company")
set (CPACK_IFW_PACKAGE_WIZARD_STYLE "Aero")
set (CPACK_IFW_PACKAGE_WIZARD_SHOW_PAGE_LIST OFF)

include(CPack)
##################CPACK





