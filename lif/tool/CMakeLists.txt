add_executable(lif
    Lif.cpp
    ../lib/CCFG.cpp
    ../lib/Cond.cpp
    ../lib/Loop.cpp
    ../lib/Func.cpp
    ../lib/Module.cpp
    ../lib/Isochronous.cpp
    )

target_link_libraries(lif LLVMPasses)
target_include_directories(lif PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../include")
