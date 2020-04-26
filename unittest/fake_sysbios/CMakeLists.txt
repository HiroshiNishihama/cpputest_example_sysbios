cmake_minimum_required(VERSION 3.8)

file(GLOB SOURCES
    "./*.c" "./*.cpp"
    )

add_library(fake_sysbios STATIC ${SOURCES})

target_include_directories(fake_sysbios
    PUBLIC "/home/hiroshi/ti/xdctools_3_61_00_16_core/packages"
    PUBLIC "/home/hiroshi/ti/bios_6_82_00_16/packages"
    PUBLIC "${CMAKE_SOURCE_DIR}/../fff"
)
