add_executable(lif
    Lif.cpp
    ../lib/Transform/CCFG.cpp
    ../lib/Transform/Cond.cpp
    ../lib/Transform/Loop.cpp
    ../lib/Transform/Func.cpp
    ../lib/Transform/Isochronous.cpp
    ../lib/Analysis/Taint.cpp
    )

target_link_libraries(lif
    LLVMCore
    LLVMIRReader
    LLVMSupport
    LLVMPasses
    LLVMAnalysis
    LLVMTransformUtils)
target_include_directories(lif PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../include")
