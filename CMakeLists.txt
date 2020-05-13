cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
cmake_policy(VERSION 3.10)

if(UNIX)
    set(CMAKE_SYSTEM_NAME Linux)
    set(CMAKE_EXECUTABLE_SUFFIX "")
elseif(WIN32)
    set(CMAKE_SYSTEM_NAME Windows)
    set(CMAKE_EXECUTABLE_SUFFIX ".exe")
endif()

set(tools_dir "${CMAKE_SOURCE_DIR}/../cr2/tools/${CMAKE_SYSTEM_NAME}")
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

set(CMAKE_C_COMPILER "${tools_dir}/riscv64-unknown-elf-gcc/bin/riscv64-unknown-elf-gcc${CMAKE_EXECUTABLE_SUFFIX}")
set(CMAKE_CXX_COMPILER "${tools_dir}/riscv64-unknown-elf-gcc/bin/riscv64-unknown-elf-g++${CMAKE_EXECUTABLE_SUFFIX}")
set(CMAKE_ASM_COMPILER "${tools_dir}/riscv64-unknown-elf-gcc/bin/riscv64-unknown-elf-gcc${CMAKE_EXECUTABLE_SUFFIX}")
set(CMAKE_LINKER "${tools_dir}/riscv64-unknown-elf-gcc/bin/riscv64-unknown-elf-ld${CMAKE_EXECUTABLE_SUFFIX}")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

project(hifive1_revb_bootloader VERSION 0.0.1 LANGUAGES C CXX ASM)

set(CMAKE_C_FLAGS_DEBUG "-g -O0")
set(CMAKE_C_FLAGS_RELEASE "-Os")
set(CMAKE_ASM_FLAGS_DEBUG ${CMAKE_C_FLAGS_DEBUG})
set(CMAKE_ASM_FLAGS_RELEASE ${CMAKE_C_FLAGS_RELEASE})
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    -nostdlib -nostartfiles -nodefaultlibs -march=rv32imac -mabi=ilp32 -mcmodel=medany \
    -pedantic -pedantic-errors -Wall -Wextra -Wcast-align -Wcast-qual -Wdisabled-optimization \
    -Wformat=2 -Winit-self -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs \
    -Wredundant-decls -Wshadow -Wsign-conversion -Wstrict-overflow=5 -Wswitch-default -Wundef \
    -Werror -Wno-unused -Winline -Wconversion -Wfloat-equal -ffreestanding -fdata-sections \
    -ffunction-sections -Wl,--gc-sections")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} ${CMAKE_C_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -ffunction-sections \
                           -Wl,--gc-sections -nostartfiles -nodefaultlibs -nostdlib -T \
                           \"${CMAKE_SOURCE_DIR}/linker.ld\"")

add_executable(${PROJECT_NAME} main.c entry.S)
add_custom_target(${PROJECT_NAME}hex
    ALL
    BYPRODUCTS "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.hex"
    COMMAND ${tools_dir}/riscv64-unknown-elf-gcc/bin/riscv64-unknown-elf-objcopy${CMAKE_EXECUTABLE_SUFFIX} -S -O ihex $<TARGET_FILE:${PROJECT_NAME}> "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.hex"
)
add_custom_target(${PROJECT_NAME}asm
    ALL
    BYPRODUCTS "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.S"
    COMMAND ${tools_dir}/riscv64-unknown-elf-gcc/bin/riscv64-unknown-elf-objdump${CMAKE_EXECUTABLE_SUFFIX} -dSC $<TARGET_FILE:${PROJECT_NAME}> > "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.S"
)
set_target_properties(${PROJECT_NAME}hex PROPERTIES ADDITIONAL_CLEAN_FILES "${PROJECT_NAME}.hex")
set_target_properties(${PROJECT_NAME}asm PROPERTIES ADDITIONAL_CLEAN_FILES "${PROJECT_NAME}.S")
add_dependencies(${PROJECT_NAME}hex ${PROJECT_NAME})
add_dependencies(${PROJECT_NAME}asm ${PROJECT_NAME})
set_target_properties(${PROJECT_NAME} PROPERTIES LINK_DEPENDS "${CMAKE_SOURCE_DIR}/linker.ld")