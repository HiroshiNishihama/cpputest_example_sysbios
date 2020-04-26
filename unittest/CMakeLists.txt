cmake_minimum_required(VERSION 3.8)

project(utest_exsample)

set(EXECFILE test.out)

file(GLOB SOURCES
    "./*.c" "./*.cpp"
    )
set(PRODUCT_SOURCES "${CMAKE_SOURCE_DIR}/../clock/clock.c")

set(CMAKE_CXX_FLAGS "-Wall -Dxdc_target_types__=gnu/targets/std.h -Dxdc_target_name__=Linux86_64")
set(CMAKE_C_FLAGS "-Wall -Dmain=main_test_target -Dxdc_target_types__=gnu/targets/std.h -Dxdc_target_name__=Linux86_64")

add_executable(${EXECFILE} ${SOURCES} ${PRODUCT_SOURCES})

target_include_directories(${EXECFILE}
    PUBLIC "/home/hiroshi/ti/xdctools_3_61_00_16_core/packages"
    PUBLIC "/home/hiroshi/ti/bios_6_82_00_16/packages"
    PUBLIC "${CMAKE_SOURCE_DIR}/../fff"
    PUBLIC "${CMAKE_SOURCE_DIR}/fake_sysbios"
)

# add cpputest library
target_link_libraries(${EXECFILE} $ENV{CPPUTEST_HOME}/libCppUTest.a)
target_link_libraries(${EXECFILE} $ENV{CPPUTEST_HOME}/libCppUTestExt.a)

add_subdirectory(fake_sysbios)

target_link_libraries(${EXECFILE} fake_sysbios)