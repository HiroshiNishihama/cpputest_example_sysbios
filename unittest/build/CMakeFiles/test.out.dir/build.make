# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hiroshi/temp/sysbios_cpputest/unittest

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hiroshi/temp/sysbios_cpputest/unittest/build

# Include any dependencies generated for this target.
include CMakeFiles/test.out.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test.out.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test.out.dir/flags.make

CMakeFiles/test.out.dir/testRunner.cpp.o: CMakeFiles/test.out.dir/flags.make
CMakeFiles/test.out.dir/testRunner.cpp.o: ../testRunner.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hiroshi/temp/sysbios_cpputest/unittest/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test.out.dir/testRunner.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test.out.dir/testRunner.cpp.o -c /home/hiroshi/temp/sysbios_cpputest/unittest/testRunner.cpp

CMakeFiles/test.out.dir/testRunner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test.out.dir/testRunner.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hiroshi/temp/sysbios_cpputest/unittest/testRunner.cpp > CMakeFiles/test.out.dir/testRunner.cpp.i

CMakeFiles/test.out.dir/testRunner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test.out.dir/testRunner.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hiroshi/temp/sysbios_cpputest/unittest/testRunner.cpp -o CMakeFiles/test.out.dir/testRunner.cpp.s

CMakeFiles/test.out.dir/testRunner.cpp.o.requires:

.PHONY : CMakeFiles/test.out.dir/testRunner.cpp.o.requires

CMakeFiles/test.out.dir/testRunner.cpp.o.provides: CMakeFiles/test.out.dir/testRunner.cpp.o.requires
	$(MAKE) -f CMakeFiles/test.out.dir/build.make CMakeFiles/test.out.dir/testRunner.cpp.o.provides.build
.PHONY : CMakeFiles/test.out.dir/testRunner.cpp.o.provides

CMakeFiles/test.out.dir/testRunner.cpp.o.provides.build: CMakeFiles/test.out.dir/testRunner.cpp.o


CMakeFiles/test.out.dir/test_clock.cpp.o: CMakeFiles/test.out.dir/flags.make
CMakeFiles/test.out.dir/test_clock.cpp.o: ../test_clock.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hiroshi/temp/sysbios_cpputest/unittest/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/test.out.dir/test_clock.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test.out.dir/test_clock.cpp.o -c /home/hiroshi/temp/sysbios_cpputest/unittest/test_clock.cpp

CMakeFiles/test.out.dir/test_clock.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test.out.dir/test_clock.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hiroshi/temp/sysbios_cpputest/unittest/test_clock.cpp > CMakeFiles/test.out.dir/test_clock.cpp.i

CMakeFiles/test.out.dir/test_clock.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test.out.dir/test_clock.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hiroshi/temp/sysbios_cpputest/unittest/test_clock.cpp -o CMakeFiles/test.out.dir/test_clock.cpp.s

CMakeFiles/test.out.dir/test_clock.cpp.o.requires:

.PHONY : CMakeFiles/test.out.dir/test_clock.cpp.o.requires

CMakeFiles/test.out.dir/test_clock.cpp.o.provides: CMakeFiles/test.out.dir/test_clock.cpp.o.requires
	$(MAKE) -f CMakeFiles/test.out.dir/build.make CMakeFiles/test.out.dir/test_clock.cpp.o.provides.build
.PHONY : CMakeFiles/test.out.dir/test_clock.cpp.o.provides

CMakeFiles/test.out.dir/test_clock.cpp.o.provides.build: CMakeFiles/test.out.dir/test_clock.cpp.o


CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o: CMakeFiles/test.out.dir/flags.make
CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o: /home/hiroshi/temp/sysbios_cpputest/clock/clock.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hiroshi/temp/sysbios_cpputest/unittest/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o   -c /home/hiroshi/temp/sysbios_cpputest/clock/clock.c

CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hiroshi/temp/sysbios_cpputest/clock/clock.c > CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.i

CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hiroshi/temp/sysbios_cpputest/clock/clock.c -o CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.s

CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o.requires:

.PHONY : CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o.requires

CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o.provides: CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o.requires
	$(MAKE) -f CMakeFiles/test.out.dir/build.make CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o.provides.build
.PHONY : CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o.provides

CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o.provides.build: CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o


# Object files for target test.out
test_out_OBJECTS = \
"CMakeFiles/test.out.dir/testRunner.cpp.o" \
"CMakeFiles/test.out.dir/test_clock.cpp.o" \
"CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o"

# External object files for target test.out
test_out_EXTERNAL_OBJECTS =

test.out: CMakeFiles/test.out.dir/testRunner.cpp.o
test.out: CMakeFiles/test.out.dir/test_clock.cpp.o
test.out: CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o
test.out: CMakeFiles/test.out.dir/build.make
test.out: /usr/local/lib/libCppUTest.a
test.out: /usr/local/lib/libCppUTestExt.a
test.out: fake_sysbios/libfake_sysbios.a
test.out: CMakeFiles/test.out.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hiroshi/temp/sysbios_cpputest/unittest/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable test.out"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test.out.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test.out.dir/build: test.out

.PHONY : CMakeFiles/test.out.dir/build

CMakeFiles/test.out.dir/requires: CMakeFiles/test.out.dir/testRunner.cpp.o.requires
CMakeFiles/test.out.dir/requires: CMakeFiles/test.out.dir/test_clock.cpp.o.requires
CMakeFiles/test.out.dir/requires: CMakeFiles/test.out.dir/home/hiroshi/temp/sysbios_cpputest/clock/clock.c.o.requires

.PHONY : CMakeFiles/test.out.dir/requires

CMakeFiles/test.out.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test.out.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test.out.dir/clean

CMakeFiles/test.out.dir/depend:
	cd /home/hiroshi/temp/sysbios_cpputest/unittest/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hiroshi/temp/sysbios_cpputest/unittest /home/hiroshi/temp/sysbios_cpputest/unittest /home/hiroshi/temp/sysbios_cpputest/unittest/build /home/hiroshi/temp/sysbios_cpputest/unittest/build /home/hiroshi/temp/sysbios_cpputest/unittest/build/CMakeFiles/test.out.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test.out.dir/depend
