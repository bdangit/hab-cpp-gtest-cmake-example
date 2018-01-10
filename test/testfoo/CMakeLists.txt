file(GLOB SRCS *.cpp)

add_executable(testfoo ${SRCS})
target_link_libraries(testfoo Threads::Threads)
target_link_libraries(testfoo gtest gtest_main)
target_link_libraries(testfoo gmock gmock_main)
target_link_libraries(testfoo libfoo)

add_test(NAME testfoo COMMAND testfoo)
