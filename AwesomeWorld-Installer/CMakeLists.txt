project(AwesomeWorld-Installer VERSION 0.2 LANGUAGES CXX DESCRIPTION "Example to illustrate QtIFW")


##################CPACK
include(InstallRequiredSystemLibraries)
set(CPACK_GENERATOR "IFW")
set(CPACK_IFW_ROOT "/home/christo/Qt-6.2/Tools/QtInstallerFramework/4.1/")
set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_CURRENT_SOURCE_DIR}/../AwesomeWorld-Installer/licence.txt)
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "0")
include(CPack)
##################CPACK
