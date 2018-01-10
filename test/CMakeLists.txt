# find threads
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

# find gtest / gmock libraries
find_package(PkgConfig)
pkg_check_modules(LIBGTEST REQUIRED libgtest)
pkg_check_modules(LIBGMOCK REQUIRED libgmock)

add_library(gtest SHARED IMPORTED)
set_target_properties(gtest PROPERTIES IMPORTED_LOCATION ${LIBGTEST_LIBRARY_DIRS}/libgtest.a)
add_library(gtest_main SHARED IMPORTED)
set_target_properties(gtest_main PROPERTIES IMPORTED_LOCATION ${LIBGTEST_LIBRARY_DIRS}/libgtest_main.a)

add_library(gmock SHARED IMPORTED)
set_target_properties(gmock PROPERTIES IMPORTED_LOCATION ${LIBGMOCK_LIBRARY_DIRS}/libgmock.a)
add_library(gmock_main SHARED IMPORTED)
set_target_properties(gmock_main PROPERTIES IMPORTED_LOCATION ${LIBGMOCK_LIBRARY_DIRS}/libgmock_main.a)

add_subdirectory(testfoo)
