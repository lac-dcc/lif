add_executable(lif
    Lif.cpp
    ../lib/Isochronous.cpp
    ../lib/Cond.cpp
    )

target_link_libraries(lif LLVMPasses)
target_include_directories(lif PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../include")
