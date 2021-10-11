project(AwesomeWorld-Installer VERSION 0.2 LANGUAGES CXX DESCRIPTION "Example to illustrate QtIFW")


##################CPACK
include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_CURRENT_SOURCE_DIR}/licence.txt)
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "0")
include(CPack)
##################CPACK
