# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.18.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.18.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/habbyge/MethodHook/app/src/main/cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/habbyge/MethodHook/app/src/main/cpp

# Include any dependencies generated for this target.
include CMakeFiles/iWatch.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/iWatch.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/iWatch.dir/flags.make

CMakeFiles/iWatch.dir/i_watch.cpp.o: CMakeFiles/iWatch.dir/flags.make
CMakeFiles/iWatch.dir/i_watch.cpp.o: i_watch.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/habbyge/MethodHook/app/src/main/cpp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/iWatch.dir/i_watch.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/iWatch.dir/i_watch.cpp.o -c /Users/habbyge/MethodHook/app/src/main/cpp/i_watch.cpp

CMakeFiles/iWatch.dir/i_watch.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/iWatch.dir/i_watch.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/habbyge/MethodHook/app/src/main/cpp/i_watch.cpp > CMakeFiles/iWatch.dir/i_watch.cpp.i

CMakeFiles/iWatch.dir/i_watch.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/iWatch.dir/i_watch.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/habbyge/MethodHook/app/src/main/cpp/i_watch.cpp -o CMakeFiles/iWatch.dir/i_watch.cpp.s

# Object files for target iWatch
iWatch_OBJECTS = \
"CMakeFiles/iWatch.dir/i_watch.cpp.o"

# External object files for target iWatch
iWatch_EXTERNAL_OBJECTS =

libiWatch.dylib: CMakeFiles/iWatch.dir/i_watch.cpp.o
libiWatch.dylib: CMakeFiles/iWatch.dir/build.make
libiWatch.dylib: /Users/habbyge/Library/Android/sdk/ndk-bundle/platforms/android-29/arch-arm/usr/lib/liblog.so
libiWatch.dylib: CMakeFiles/iWatch.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/habbyge/MethodHook/app/src/main/cpp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libiWatch.dylib"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/iWatch.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/iWatch.dir/build: libiWatch.dylib

.PHONY : CMakeFiles/iWatch.dir/build

CMakeFiles/iWatch.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/iWatch.dir/cmake_clean.cmake
.PHONY : CMakeFiles/iWatch.dir/clean

CMakeFiles/iWatch.dir/depend:
	cd /Users/habbyge/MethodHook/app/src/main/cpp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/habbyge/MethodHook/app/src/main/cpp /Users/habbyge/MethodHook/app/src/main/cpp /Users/habbyge/MethodHook/app/src/main/cpp /Users/habbyge/MethodHook/app/src/main/cpp /Users/habbyge/MethodHook/app/src/main/cpp/CMakeFiles/iWatch.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/iWatch.dir/depend

