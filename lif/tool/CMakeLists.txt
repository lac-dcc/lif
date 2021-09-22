add_executable(lif
    Lif.cpp
    ../lib/Isochronous.cpp
    ../lib/Cond.cpp
    ../lib/Loop.cpp
    ../lib/Func.cpp
    ../lib/Module.cpp
    ../lib/CCFG.cpp
    )

target_link_libraries(lif LLVMPasses)
target_include_directories(lif PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../include")
