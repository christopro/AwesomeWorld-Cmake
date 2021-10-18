cmake_minimum_required(VERSION 3.2)

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

# Set the name of our components
set(COMPONENT_NAME_MAIN "AwesomeWorld")
set(COMPONENT_NAME_DEPENDENCIES "RuntimeLibs")

include(GNUInstallDirs)
install(TARGETS awesomeWorld DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT ${COMPONENT_NAME_MAIN})

# Upon include(InstallRequiredSystemLibraries), install(PROGRAMS) is called.
# We can specify the install(PROGRAMS) command COMPONENT option.
# If none is specified and we use COMPONENT_NAME_MAIN for our target, CMAKE_INSTALL_DEFAULT_COMPONENT_NAME ("Unspecified") will be used
# If we specify COMPONENT_NAME_MAIN for this, cpack_ifw_configure_component(${COMPONENT_NAME_MAIN} LICENSES... doesn't work
set(CMAKE_INSTALL_SYSTEM_RUNTIME_COMPONENT ${COMPONENT_NAME_DEPENDENCIES})
include(InstallRequiredSystemLibraries)

set(CPACK_GENERATOR "IFW")
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "0")

set(CPACK_IFW_ROOT "C:/Qt/Tools/QtInstallerFramework/4.1/") #QTIFWDIR is used by default
set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_CURRENT_SOURCE_DIR}/../AwesomeWorld-Installer/licence.txt)

include(CPack)
include(CPackIFW)

# List controlling which components are installed
#set(CPACK_COMPONENTS_ALL ${COMPONENT_NAME_MAIN})
#message(STATUS "CPACK_COMPONENTS_ALL = " ${CPACK_COMPONENTS_ALL})

# Install the runtime libs but don't show them in the installer
cpack_ifw_configure_component(${COMPONENT_NAME_DEPENDENCIES} VIRTUAL FORCED_INSTALLATION)

# The awesome app component HAS to be installed
cpack_ifw_configure_component(${COMPONENT_NAME_MAIN} ESSENTIAL FORCED_INSTALLATION)

# Adds license info to package.xml file
# Also copies licence.txt to 'meta' directory to display the license text in the installer.
cpack_ifw_configure_component(${COMPONENT_NAME_MAIN} LICENSES "ICS License" ${CPACK_RESOURCE_FILE_LICENSE})



