# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/salman1567/Downloads/looking-glass-B5.0.1/client

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/salman1567/Downloads/looking-glass-B5.0.1/client/build

# Include any dependencies generated for this target.
include displayservers/X11/CMakeFiles/displayserver_X11.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include displayservers/X11/CMakeFiles/displayserver_X11.dir/compiler_depend.make

# Include the progress variables for this target.
include displayservers/X11/CMakeFiles/displayserver_X11.dir/progress.make

# Include the compile flags for this target's objects.
include displayservers/X11/CMakeFiles/displayserver_X11.dir/flags.make

displayservers/X11/CMakeFiles/displayserver_X11.dir/x11.c.o: displayservers/X11/CMakeFiles/displayserver_X11.dir/flags.make
displayservers/X11/CMakeFiles/displayserver_X11.dir/x11.c.o: ../displayservers/X11/x11.c
displayservers/X11/CMakeFiles/displayserver_X11.dir/x11.c.o: displayservers/X11/CMakeFiles/displayserver_X11.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/salman1567/Downloads/looking-glass-B5.0.1/client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object displayservers/X11/CMakeFiles/displayserver_X11.dir/x11.c.o"
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && /sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT displayservers/X11/CMakeFiles/displayserver_X11.dir/x11.c.o -MF CMakeFiles/displayserver_X11.dir/x11.c.o.d -o CMakeFiles/displayserver_X11.dir/x11.c.o -c /home/salman1567/Downloads/looking-glass-B5.0.1/client/displayservers/X11/x11.c

displayservers/X11/CMakeFiles/displayserver_X11.dir/x11.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/displayserver_X11.dir/x11.c.i"
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && /sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/salman1567/Downloads/looking-glass-B5.0.1/client/displayservers/X11/x11.c > CMakeFiles/displayserver_X11.dir/x11.c.i

displayservers/X11/CMakeFiles/displayserver_X11.dir/x11.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/displayserver_X11.dir/x11.c.s"
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && /sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/salman1567/Downloads/looking-glass-B5.0.1/client/displayservers/X11/x11.c -o CMakeFiles/displayserver_X11.dir/x11.c.s

displayservers/X11/CMakeFiles/displayserver_X11.dir/atoms.c.o: displayservers/X11/CMakeFiles/displayserver_X11.dir/flags.make
displayservers/X11/CMakeFiles/displayserver_X11.dir/atoms.c.o: ../displayservers/X11/atoms.c
displayservers/X11/CMakeFiles/displayserver_X11.dir/atoms.c.o: displayservers/X11/CMakeFiles/displayserver_X11.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/salman1567/Downloads/looking-glass-B5.0.1/client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object displayservers/X11/CMakeFiles/displayserver_X11.dir/atoms.c.o"
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && /sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT displayservers/X11/CMakeFiles/displayserver_X11.dir/atoms.c.o -MF CMakeFiles/displayserver_X11.dir/atoms.c.o.d -o CMakeFiles/displayserver_X11.dir/atoms.c.o -c /home/salman1567/Downloads/looking-glass-B5.0.1/client/displayservers/X11/atoms.c

displayservers/X11/CMakeFiles/displayserver_X11.dir/atoms.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/displayserver_X11.dir/atoms.c.i"
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && /sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/salman1567/Downloads/looking-glass-B5.0.1/client/displayservers/X11/atoms.c > CMakeFiles/displayserver_X11.dir/atoms.c.i

displayservers/X11/CMakeFiles/displayserver_X11.dir/atoms.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/displayserver_X11.dir/atoms.c.s"
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && /sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/salman1567/Downloads/looking-glass-B5.0.1/client/displayservers/X11/atoms.c -o CMakeFiles/displayserver_X11.dir/atoms.c.s

displayservers/X11/CMakeFiles/displayserver_X11.dir/clipboard.c.o: displayservers/X11/CMakeFiles/displayserver_X11.dir/flags.make
displayservers/X11/CMakeFiles/displayserver_X11.dir/clipboard.c.o: ../displayservers/X11/clipboard.c
displayservers/X11/CMakeFiles/displayserver_X11.dir/clipboard.c.o: displayservers/X11/CMakeFiles/displayserver_X11.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/salman1567/Downloads/looking-glass-B5.0.1/client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object displayservers/X11/CMakeFiles/displayserver_X11.dir/clipboard.c.o"
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && /sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT displayservers/X11/CMakeFiles/displayserver_X11.dir/clipboard.c.o -MF CMakeFiles/displayserver_X11.dir/clipboard.c.o.d -o CMakeFiles/displayserver_X11.dir/clipboard.c.o -c /home/salman1567/Downloads/looking-glass-B5.0.1/client/displayservers/X11/clipboard.c

displayservers/X11/CMakeFiles/displayserver_X11.dir/clipboard.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/displayserver_X11.dir/clipboard.c.i"
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && /sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/salman1567/Downloads/looking-glass-B5.0.1/client/displayservers/X11/clipboard.c > CMakeFiles/displayserver_X11.dir/clipboard.c.i

displayservers/X11/CMakeFiles/displayserver_X11.dir/clipboard.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/displayserver_X11.dir/clipboard.c.s"
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && /sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/salman1567/Downloads/looking-glass-B5.0.1/client/displayservers/X11/clipboard.c -o CMakeFiles/displayserver_X11.dir/clipboard.c.s

# Object files for target displayserver_X11
displayserver_X11_OBJECTS = \
"CMakeFiles/displayserver_X11.dir/x11.c.o" \
"CMakeFiles/displayserver_X11.dir/atoms.c.o" \
"CMakeFiles/displayserver_X11.dir/clipboard.c.o"

# External object files for target displayserver_X11
displayserver_X11_EXTERNAL_OBJECTS =

displayservers/X11/libdisplayserver_X11.a: displayservers/X11/CMakeFiles/displayserver_X11.dir/x11.c.o
displayservers/X11/libdisplayserver_X11.a: displayservers/X11/CMakeFiles/displayserver_X11.dir/atoms.c.o
displayservers/X11/libdisplayserver_X11.a: displayservers/X11/CMakeFiles/displayserver_X11.dir/clipboard.c.o
displayservers/X11/libdisplayserver_X11.a: displayservers/X11/CMakeFiles/displayserver_X11.dir/build.make
displayservers/X11/libdisplayserver_X11.a: displayservers/X11/CMakeFiles/displayserver_X11.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/salman1567/Downloads/looking-glass-B5.0.1/client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C static library libdisplayserver_X11.a"
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && $(CMAKE_COMMAND) -P CMakeFiles/displayserver_X11.dir/cmake_clean_target.cmake
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/displayserver_X11.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
displayservers/X11/CMakeFiles/displayserver_X11.dir/build: displayservers/X11/libdisplayserver_X11.a
.PHONY : displayservers/X11/CMakeFiles/displayserver_X11.dir/build

displayservers/X11/CMakeFiles/displayserver_X11.dir/clean:
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 && $(CMAKE_COMMAND) -P CMakeFiles/displayserver_X11.dir/cmake_clean.cmake
.PHONY : displayservers/X11/CMakeFiles/displayserver_X11.dir/clean

displayservers/X11/CMakeFiles/displayserver_X11.dir/depend:
	cd /home/salman1567/Downloads/looking-glass-B5.0.1/client/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/salman1567/Downloads/looking-glass-B5.0.1/client /home/salman1567/Downloads/looking-glass-B5.0.1/client/displayservers/X11 /home/salman1567/Downloads/looking-glass-B5.0.1/client/build /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11 /home/salman1567/Downloads/looking-glass-B5.0.1/client/build/displayservers/X11/CMakeFiles/displayserver_X11.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : displayservers/X11/CMakeFiles/displayserver_X11.dir/depend

